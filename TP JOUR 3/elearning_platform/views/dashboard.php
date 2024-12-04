<?php
include __DIR__ . '/../models/config.php';
// Inclure la configuration de la connexion à la base de données
session_start();

// Vérifier si l'utilisateur est connecté en tant qu'étudiant
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
    header("Location: /../controllers/login.php");
    exit;
}

// Récupérer la liste des cours
try {
    $courses_sql = "SELECT id, title, description, price, status FROM courses";
    $courses_stmt = $conn->prepare($courses_sql);
    $courses_stmt->execute();
    $courses = $courses_stmt->fetchAll();
    
    echo "<!DOCTYPE html>";
    echo "<html lang='fr'>";
    echo "<head>";
    echo "<meta charset='UTF-8'>";
    echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
    echo "<title>Dashboard - Liste des Cours</title>";
    echo "<style>";
    echo "body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }";
    echo "header { background-color: #007BFF; color: white; padding: 20px; text-align: center; }";
    echo ".container { max-width: 1000px; margin: 30px auto; padding: 20px; background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }";
    echo "table { width: 100%; margin: 20px 0; border-collapse: collapse; }";
    echo "th, td { padding: 10px; text-align: left; border: 1px solid #ccc; }";
    echo "th { background-color: #f4f4f4; }";
    echo "a { color: #007BFF; text-decoration: none; }";
    echo "a:hover { text-decoration: underline; }";
    echo "</style>";
    echo "</head>";
    echo "<body>";
    echo "<header>";
    echo "<h1>Dashboard des Cours</h1>";
    echo "</header>";
    
    echo "<div class='container'>";
    echo "<h2>Liste des Cours</h2>";
    
    if (count($courses) > 0) {
        echo "<table>";
        echo "<thead><tr><th>ID</th><th>Titre</th><th>Description</th><th>Prix</th><th>Statut</th><th>Actions</th></tr></thead>";
        echo "<tbody>";
        
        foreach ($courses as $course) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($course['id']) . "</td>";
            echo "<td>" . htmlspecialchars($course['title']) . "</td>";
            echo "<td>" . htmlspecialchars($course['description']) . "</td>";
            echo "<td>" . htmlspecialchars($course['price']) . " EUR</td>";
            echo "<td>" . htmlspecialchars($course['status']) . "</td>";
            echo "<td>";
            echo "<a href='../controllers/course.php?id=" . $course['id'] . "'>Voir le cours</a> | ";
            echo "<a href='../controllers/enroll.php?course_id=" . $course['id'] . "'>S'inscrire</a>";
            echo "</td>";
            echo "</tr>";
        }
        
        echo "</tbody>";
        echo "</table>";
    } else {
        echo "<p>Aucun cours disponible.</p>";
    }

    echo "</div>";  // Fin du conteneur
    echo "</body>";
    echo "</html>";
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>
