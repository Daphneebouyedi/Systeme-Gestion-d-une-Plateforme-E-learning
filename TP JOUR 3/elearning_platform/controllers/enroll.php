<?php
include __DIR__ . '/../models/config.php';
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
    header("Location: ../views/login.php");
    exit;
}

if (!isset($_GET['course_id'])) {
    echo "Erreur : Identifiant du cours manquant.";
    exit;
}

$user_id = $_SESSION['user_id'];
$course_id = $_GET['course_id'];

// Vérifier si l'utilisateur est déjà inscrit
$check_sql = "SELECT * FROM enrollments WHERE student_id = :user_id AND course_id = :course_id";
$check_stmt = $conn->prepare($check_sql);
$check_stmt->execute(['user_id' => $user_id, 'course_id' => $course_id]);

// Récupérer les informations du cours
$course_sql = "SELECT title, description, price FROM courses WHERE id = :course_id";
$course_stmt = $conn->prepare($course_sql);
$course_stmt->execute(['course_id' => $course_id]);
$course = $course_stmt->fetch();

if (!$course) {
    echo "Erreur : Cours non trouvé.";
    exit;
}

// HTML avec style similaire à dashboard.php
echo "<!DOCTYPE html>";
echo "<html lang='fr'>";
echo "<head>";
echo "<meta charset='UTF-8'>";
echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Inscription au cours - " . htmlspecialchars($course['title']) . "</title>";
echo "<style>";
echo "body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }";
echo "header { background-color: #007BFF; color: white; padding: 20px; text-align: center; }";
echo ".container { max-width: 600px; margin: 30px auto; padding: 20px; background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }";
echo ".course-details { margin-bottom: 20px; }";
echo ".btn { display: inline-block; margin-top: 15px; padding: 10px 20px; background-color: #007BFF; color: white; text-align: center; border-radius: 5px; text-decoration: none; }";
echo ".btn:hover { background-color: #0056b3; }";
echo ".message { margin-top: 20px; color: green; }";
echo "</style>";
echo "</head>";
echo "<body>";

echo "<header>";
echo "<h1>Inscription au cours</h1>";
echo "</header>";

echo "<div class='container'>";

// Vérification de l'inscription et message
if ($check_stmt->rowCount() > 0) {
    echo "<p class='message'>Vous êtes déjà inscrit à ce cours.</p>";
} else {
    // Inscrire l'étudiant au cours
    $enroll_sql = "INSERT INTO enrollments (student_id, course_id) VALUES (:user_id, :course_id)";
    $enroll_stmt = $conn->prepare($enroll_sql);
    $enroll_stmt->execute(['user_id' => $user_id, 'course_id' => $course_id]);
    echo "<p class='message'>Inscription réussie !</p>";
}

// Affichage des informations du cours
echo "<div class='course-details'>";
echo "<h2>" . htmlspecialchars($course['title']) . "</h2>";
echo "<p>" . htmlspecialchars($course['description']) . "</p>";
echo "<p>Prix : " . htmlspecialchars($course['price']) . " EUR</p>";
echo "</div>";

// Lien retour au tableau de bord
echo "<a href='../views/dashboard.php' class='btn'>Retour au tableau de bord</a>";

echo "</div>";  // Fin du conteneur
echo "</body>";
echo "</html>";
?>
