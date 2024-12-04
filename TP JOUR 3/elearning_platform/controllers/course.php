<?php
include '../models/config.php';  // Inclure la configuration de la connexion à la base de données

// Vérifier si l'ID du cours est passé dans l'URL
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $course_id = $_GET['id'];
} else {
    echo "<p style='color:red; text-align:center;'>ID du cours manquant dans l'URL.</p>";
    exit;
}

try {
    // Préparer et exécuter la requête pour récupérer les informations du cours
    $course_sql = "SELECT * FROM courses WHERE id = :course_id";
    $course_stmt = $conn->prepare($course_sql);
    $course_stmt->execute(['course_id' => $course_id]);
    $course = $course_stmt->fetch();

    // Si le cours existe, afficher ses informations
    if ($course) {
        echo "<!DOCTYPE html>";
        echo "<html lang='fr'>";
        echo "<head>";
        echo "<meta charset='UTF-8'>";
        echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
        echo "<title>Détails du Cours - " . htmlspecialchars($course['title']) . "</title>";
        echo "<style>";
        echo "body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }";
        echo "header { background-color: #007BFF; color: white; padding: 20px; text-align: center; }";
        echo ".container { max-width: 1000px; margin: 30px auto; padding: 20px; background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }";
        echo ".course-info { margin-bottom: 20px; text-align: center; }";
        echo ".course-info h2 { font-size: 2rem; }";
        echo ".course-info p { font-size: 1.2rem; color: #333; }";
        echo "table { width: 100%; margin: 20px 0; border-collapse: collapse; }";
        echo "th, td { padding: 10px; text-align: left; border: 1px solid #ccc; }";
        echo "th { background-color: #f4f4f4; }";
        echo "a { color: #007BFF; text-decoration: none; }";
        echo "a:hover { text-decoration: underline; }";
        echo ".lesson-list { margin-top: 20px; padding-top: 20px; border-top: 1px solid #ccc; }";
        echo ".lesson-list h3 { font-size: 1.5rem; margin-bottom: 10px; }";
        echo ".lesson-list ul { list-style-type: none; padding: 0; }";
        echo ".lesson-list li { padding: 10px 0; border-bottom: 1px solid #f4f4f4; }";
        echo "</style>";
        echo "</head>";
        echo "<body>";
        echo "<header>";
        echo "<h1>Détails du Cours</h1>";
        echo "</header>";

        // Conteneur principal
        echo "<div class='container'>";

        // Informations sur le cours sans la colonne "Durée"
        echo "<div class='course-info'>";
        echo "<h2>" . htmlspecialchars($course['title']) . "</h2>";
        echo "<p>" . htmlspecialchars($course['description']) . "</p>";
        echo "<p><strong>Prix:</strong> " . htmlspecialchars($course['price']) . " EUR</p>";
        echo "<p><strong>Statut:</strong> " . htmlspecialchars($course['status']) . "</p>";
        echo "</div>";

        // Récupérer les leçons du cours
        $lessons_sql = "SELECT * FROM lessons WHERE course_id = :course_id ORDER BY order_num";
        $lessons_stmt = $conn->prepare($lessons_sql);
        $lessons_stmt->execute(['course_id' => $course_id]);
        $lessons = $lessons_stmt->fetchAll();

        // Afficher les leçons sans la colonne "Durée"
        if (count($lessons) > 0) {
            echo "<div class='lesson-list'>";
            echo "<h3>Leçons disponibles :</h3>";
            echo "<ul>";

            foreach ($lessons as $lesson) {
                echo "<li>";
                echo "<strong>" . htmlspecialchars($lesson['title']) . "</strong><br>";
                echo "<p>" . htmlspecialchars($lesson['content']) . "</p>";
                echo "<p><strong>Numéro de l'ordre:</strong> " . htmlspecialchars($lesson['order_num']) . "</p>";
                echo "</li>";
            }

            echo "</ul>";
            echo "</div>";
        } else {
            echo "<p>Aucune leçon disponible pour ce cours.</p>";
        }

        // Lien retour
        echo "<a href='../views/dashboard.php' style='color: #007BFF; text-decoration: none;'>Retour au Dashboard</a>";
        echo "<a href='../controllers/logout.php' style='color: #007BFF; text-decoration: none; margin-left: 20px;'>Se déconnecter</a>";

        echo "</div>";  // Fin du conteneur
        echo "</body>";
        echo "</html>";
    } else {
        echo "<p>Cours introuvable.</p>";
    }
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>
