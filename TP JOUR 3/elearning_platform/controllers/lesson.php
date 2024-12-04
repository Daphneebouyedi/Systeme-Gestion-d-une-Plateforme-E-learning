<?php
include '../models/config.php';
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
    header("Location: login.php");
    exit;
}

$lesson_id = $_GET['lesson_id'];
$user_id = $_SESSION['user_id'];

// Récupérer la leçon
$lesson_sql = "SELECT * FROM lessons WHERE id = :lesson_id";
$lesson_stmt = $conn->prepare($lesson_sql);
$lesson_stmt->execute(['lesson_id' => $lesson_id]);
$lesson = $lesson_stmt->fetch();

if (!$lesson) {
    header("Location: error.php?message=Leçon introuvable");
    exit;
}

// Mettre à jour le statut de la progression
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Code pour mettre à jour le statut de la progression
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($lesson['title']); ?></title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="container">
        <h2><?php echo htmlspecialchars($lesson['title']); ?></h2>
        <p><?php echo nl2br(htmlspecialchars($lesson['content'])); ?></p>
        <form method="POST" action="lesson.php?lesson_id=<?php echo $lesson_id; ?>">
            <!-- Ajouter des champs pour mettre à jour le statut de la progression -->
            <button type="submit">Marquer comme terminé</button>
        </form>
    </div>
</body>
</html>