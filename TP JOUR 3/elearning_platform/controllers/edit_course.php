<?php
include '../models/config.php';
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../controllers/login.php");
    exit;
}

$course_id = $_GET['id']; // Récupère l'ID du cours à éditer

// Récupérer les informations du cours depuis la base de données
$course_sql = "SELECT * FROM courses WHERE id = :course_id";
$course_stmt = $conn->prepare($course_sql);
$course_stmt->execute(['course_id' => $course_id]);
$course = $course_stmt->fetch();

if (!$course) {
    echo "Cours introuvable.";
    exit;
}

// Traitement du formulaire d'édition
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $status = $_POST['status'];

    // Mettre à jour le cours dans la base de données
    $update_sql = "UPDATE courses SET title = :title, description = :description, price = :price, status = :status WHERE id = :course_id";
    $update_stmt = $conn->prepare($update_sql);
    $update_stmt->execute(['title' => $title, 'description' => $description, 'price' => $price, 'status' => $status, 'course_id' => $course_id]);

    echo "Cours mis à jour avec succès!";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier le Cours - Ynov Learning</title>
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
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input, textarea, select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }
        button {
            padding: 10px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .navigation-links {
            text-align: center;
            margin-top: 20px;
        }
        .navigation-links a {
            margin: 0 15px;
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        .navigation-links a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1>Modifier le Cours</h1>
</header>

<div class="container">
    <h2>Modifier le cours : <?php echo htmlspecialchars($course['title']); ?></h2>

    <form method="POST" action="">
        <input type="text" name="title" value="<?php echo htmlspecialchars($course['title']); ?>" required placeholder="Titre du cours">
        <textarea name="description" required placeholder="Description du cours"><?php echo htmlspecialchars($course['description']); ?></textarea>
        <input type="number" name="price" value="<?php echo htmlspecialchars($course['price']); ?>" step="0.01" required placeholder="Prix (EUR)">
        <select name="status" required>
            <option value="draft" <?php if ($course['status'] == 'draft') echo 'selected'; ?>>Brouillon</option>
            <option value="published" <?php if ($course['status'] == 'published') echo 'selected'; ?>>Publié</option>
            <option value="archived" <?php if ($course['status'] == 'archived') echo 'selected'; ?>>Archivé</option>
        </select>
        <button type="submit">Mettre à jour le cours</button>
    </form>

    <!-- Lien Retour et autres rubriques d'intérêt -->
    <div class="navigation-links">
        <a href="../controllers/admin_dashboard.php">Retour au Tableau de Bord</a>
        <a href="../controllers/manage_courses.php">Gérer les Cours</a>
    </div>
</div>

</body>
</html>
