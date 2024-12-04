<?php
include '../models/config.php';
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../controllers/login.php");
    exit;
}

// Récupérer tous les cours
$courses_sql = "SELECT * FROM courses";
$courses_stmt = $conn->query($courses_sql);
$courses = $courses_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Cours - Ynov Learning</title>
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
        .courses-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .course-card {
            width: 200px;
            padding: 15px;
            background-color: #e9ecef;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .course-card p {
            margin: 5px 0;
        }
        .btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1>Gestion des Cours</h1>
</header>

<div class="container">
    <h2>Liste des Cours</h2>
    <div class="courses-list">
        <?php foreach ($courses as $course): ?>
            <div class="course-card">
                <p><strong><?php echo htmlspecialchars($course['title']); ?></strong></p>
                <p>Statut: <?php echo htmlspecialchars($course['status']); ?></p>
                <a href="../controllers/edit_course.php?id=<?php echo $course['id']; ?>" class="btn">Modifier</a>
            </div>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>
