<?php
$ip = $_SERVER['REMOTE_ADDR'] ?? 'N/A';
$host = $_SERVER['SERVER_NAME'] ?? 'N/A';
$software = $_SERVER['SERVER_SOFTWARE'] ?? 'N/A';

try {
    $dsn = "mysql:host=tp3_mysql1;dbname=tp3db;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ];
    $attempts = 0;
    $maxAttempts = 60; // up to ~18s (60 * 300ms)
    $pdo = null;
    while ($attempts < $maxAttempts) {
        try {
            $pdo = new PDO($dsn, "tp3user", "tp3pass", $options);
            break;
        } catch (PDOException $inner) {
            $attempts++;
            usleep(1000000); // 1s before retry (up to ~60s)
            if ($attempts >= $maxAttempts) {
                throw $inner;
            }
        }
    }
    $dbHost = $pdo->query("SELECT @@hostname AS hostname")->fetch()['hostname'] ?? 'unknown';
    $row = $pdo->query("SELECT id, label FROM demo ORDER BY id DESC LIMIT 1")->fetch();
    $label = $row ? ($row['label'] . " (id=" . $row['id'] . ")") : 'aucune donnée';
    $status = "<p class='success'>Connexion MySQL ✔ — hôte DB: <strong>{$dbHost}</strong><br>Dernière entrée: <em>{$label}</em></p>";
} catch (PDOException $e) {
    $status = "<p class='error'>Erreur de connexion à MySQL : " . htmlspecialchars($e->getMessage()) . "</p>";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Serveur 1</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f8ff;
            color: #333;
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        p {
            margin: 10px 0;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Bienvenue sur le serveur 1</h1>
    <p><strong>IP du client :</strong> <?= $ip ?></p>
    <p><strong>Nom du serveur :</strong> <?= $host ?></p>
    <p><strong>Logiciel serveur :</strong> <?= $software ?></p>
    <?= $status ?>
</body>
</html>
