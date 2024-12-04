<?php
// Démarrer la session
session_start();

// Détruire la session pour déconnecter l'utilisateur
session_destroy();

// Rediriger vers la page d'accueil ou login
header('Location: login.php');  // Si vous avez une page de connexion
exit;
?>
