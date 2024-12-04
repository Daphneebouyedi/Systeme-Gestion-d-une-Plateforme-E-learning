<?php
include '../models/config.php';
session_start();

// Vérification de la session de l'utilisateur (enseignant)
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'teacher') {
    header("Location: ../controllers/login.php");
    exit;
}

$teacher_id = $_SESSION['user_id'];
$course_id = $_GET['course_id'];

// Récupérer les étudiants inscrits à ce cours
$students_sql = "SELECT e.student_id, u.first_name, u.last_name, p.status
                 FROM enrollments e
                 JOIN users u ON e.student_id = u.id
                 LEFT JOIN progress_tracking p ON e.student_id = p.student_id
                 LEFT JOIN lessons l ON p.lesson_id = l.id AND l.course_id = e.course_id
                 WHERE e.course_id = :course_id";
$students_stmt = $conn->prepare($students_sql);
$students_stmt->execute(['course_id' => $course_id]);
$students = $students_stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Progression des Étudiants</title>
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
        .btn-back {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<header>
    <h1>Progression des Étudiants</h1>
</header>

<div class="container">

    <!-- Bouton Retour -->
    <a href="../views/teacher_dashboard.php" class="btn-back">Retour</a>

    <h2>Étudiants inscrits et leur progression</h2>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Progression</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($students as $student): ?>
                <tr>
                    <td><?= htmlspecialchars($student['first_name']) . " " . htmlspecialchars($student['last_name']) ?></td>
                    <td><?= htmlspecialchars($student['status']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

</div>

</body>
</html>
