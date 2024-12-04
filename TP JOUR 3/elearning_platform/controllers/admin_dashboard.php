<?php
include '../models/config.php';
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../controllers/login.php");
    exit;
}

// Récupérer tous les utilisateurs
$users_sql = "SELECT * FROM users";
$users_stmt = $conn->query($users_sql);
$users = $users_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin - Ynov Learning</title>
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
            display: flex;
            justify-content: space-between;
        }
        h2, h3 {
            text-align: center;
        }
        .users-list {
            flex: 1;
            margin-right: 20px;
        }
        .manage-courses {
            width: 300px; /* Largeur fixe pour la section des cours */
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
        }
        .user-card {
            width: 100%;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }
        .user-card p {
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
    <h1>Dashboard Administrateur</h1>
</header>

<div class="container">
    <!-- Colonne 1 : Liste des utilisateurs -->
    <div class="users-list">
        <h2>Liste des utilisateurs</h2>
        <div class="users-list">
            <?php foreach ($users as $user): ?>
                <div class="user-card">
                    <p><strong><?php echo htmlspecialchars($user['first_name']) . " " . htmlspecialchars($user['last_name']); ?></strong></p>
                    <p>Rôle: <?php echo htmlspecialchars($user['role']); ?></p>
                    <a href="../controllers/edit_user.php?id=<?php echo $user['id']; ?>" class="btn">Modifier le rôle</a>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Colonne 2 : Gestion des Cours -->
    <div class="manage-courses">
        <h3>Gestion des Cours</h3>
        <a href="../controllers/manage_courses.php" class="btn">Gérer les cours</a>
    </div>
</div>

</body>
</html>
