<?php
include '../models/config.php';  // Inclure la configuration de la connexion à la base de données

try {
    // Récupérer les cours
    $courses_sql = "SELECT * FROM courses";
    $courses_stmt = $conn->prepare($courses_sql);
    $courses_stmt->execute();
    $courses = $courses_stmt->fetchAll();

    echo "<!DOCTYPE html>";
    echo "<html lang='fr'>";
    echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>Liste des Cours</title></head>";
    echo "<body>";

    // Afficher la liste des cours
    echo "<h1>Liste des Cours</h1>";
    if (count($courses) > 0) {
        echo "<ul>";
        foreach ($courses as $course) {
            echo "<li><a href='/../controllers/course.php?id=" . $course['id'] . "'>" . htmlspecialchars($course['title']) . "</a></li>";
        }
        echo "</ul>";
    } else {
        echo "<p>Aucun cours disponible.</p>";
    }

    echo "</body>";
    echo "</html>";
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>
