<?php
include '../models/config.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Requête pour récupérer l'utilisateur basé sur l'email
    $sql = "SELECT * FROM users WHERE email = :email";
    $stmt = $conn->prepare($sql);
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch();

    // Vérifier si l'utilisateur existe et si le mot de passe est valide
    if ($user && $password === $user['password_hash']) {  // Comparaison du mot de passe en texte clair avec le haché
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['role'] = $user['role'];

        // Redirection selon le rôle de l'utilisateur
        if ($user['role'] === 'admin') {
            header("Location: ../controllers/admin_dashboard.php");
            exit;
        } elseif ($user['role'] === 'teacher') {
            header("Location: ../views/teacher_dashboard.php");
            exit;
        } else {
            header("Location: ../views/dashboard.php");  // Tableau de bord des étudiants
            exit;
        }
    } else {
        echo "<p style='color:red; text-align:center;'>Identifiants incorrects.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Se connecter à Ynov Learning</title>
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
            max-width: 400px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
        .register-link a {
            color: #007BFF;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Se connecter à Ynov Learning</h1>
</header>

<div class="container">
    <h2>Se connecter</h2>
    <form method="POST" action="">
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="password" placeholder="Mot de passe " required>
        <button type="submit">Se connecter</button>
    </form>

    <div class="register-link">
        <p>Pas de compte ? <a href="../controllers/register.php">S'inscrire ici</a></p>
    </div>
</div>

</body>
</html>
