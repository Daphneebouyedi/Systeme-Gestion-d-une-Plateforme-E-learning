<?php
include '../models/config.php';
session_start();

// Vérification de la session de l'utilisateur (enseignant)
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'teacher') {
    header("Location: ../controllers/login.php");
    exit;
}

$teacher_id = $_SESSION['user_id'];

// Récupérer les cours de l'enseignant
$courses_sql = "SELECT id, title, status FROM courses WHERE teacher_id = :teacher_id";
$courses_stmt = $conn->prepare($courses_sql);
$courses_stmt->execute(['teacher_id' => $teacher_id]);
$courses = $courses_stmt->fetchAll();

// Récupérer les étudiants inscrits aux cours de l'enseignant et leur progression
$students_sql = "SELECT e.student_id, u.first_name, u.last_name, c.title AS course_title, p.status
                 FROM enrollments e
                 JOIN users u ON e.student_id = u.id
                 JOIN courses c ON e.course_id = c.id
                 LEFT JOIN progress_tracking p ON e.student_id = p.student_id 
                 AND p.lesson_id IN (SELECT id FROM lessons WHERE course_id = e.course_id)
                 WHERE c.teacher_id = :teacher_id";
$students_stmt = $conn->prepare($students_sql);
$students_stmt->execute(['teacher_id' => $teacher_id]);
$students = $students_stmt->fetchAll();

$studentsCount = count($students);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord Enseignant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007BFF;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<header>
    <h1>Tableau de bord Enseignant</h1>
</header>

<div class="container">


    <h2>Mes Cours</h2>
    <table>
        <thead>
            <tr>
                <th>Titre</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($courses as $course): ?>
                <tr>
                    <td><?= htmlspecialchars($course['title']) ?></td>
                    <td><?= htmlspecialchars($course['status']) ?></td>
                    <td>
                        <a href="../controllers/edit_course.php?course_id=<?= $course['id'] ?>" class="btn">Modifier</a>
                        <a href="../views/view_progress.php?course_id=<?= $course['id'] ?>" class="btn">Voir la progression des étudiants</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Liste des étudiants -->
    <h2>Étudiants inscrits à mes cours</h2>
    <?php if ($studentsCount > 0): ?>
        <table>
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Cours</th>
                    <th>Progression</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($students as $student): ?>
                    <tr>
                        <td><?= htmlspecialchars($student['first_name']) . " " . htmlspecialchars($student['last_name']) ?></td>
                        <td><?= htmlspecialchars($student['course_title']) ?></td>
                        <td><?= htmlspecialchars($student['status']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Aucun étudiant inscrit à mes cours pour le moment.</p>
    <?php endif; ?>

</div>

</body>
</html>
