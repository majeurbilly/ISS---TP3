<?php
$ip = $_SERVER['REMOTE_ADDR'] ?? 'N/A';
$host = $_SERVER['SERVER_NAME'] ?? 'N/A';
$software = $_SERVER['SERVER_SOFTWARE'] ?? 'N/A';
$server_addr = $_SERVER['SERVER_ADDR'] ?? 'N/A';
$request_time = $_SERVER['REQUEST_TIME'] ?? time();
$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? 'N/A';

try {
    $pdo = new PDO("mysql:host=tp3_mysql2;dbname=tp3db", "tp3user", "tp3pass");
    $status = "<p class='success'>Connexion à la base de données réussie ✔</p>";
    
    // Test de requête MySQL
    $stmt = $pdo->query("SELECT * FROM server_info ORDER BY id DESC LIMIT 1");
    $db_info = $stmt->fetch(PDO::FETCH_ASSOC);
    $db_status = $db_info ? "<p class='success'>Données MySQL: " . htmlspecialchars($db_info['server_name']) . "</p>" : "<p class='info'>Aucune donnée trouvée</p>";
} catch (PDOException $e) {
    $status = "<p class='error'>Erreur de connexion à MySQL : " . $e->getMessage() . "</p>";
    $db_status = "";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Serveur 2</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff3cd;
            color: #333;
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #fd7e14;
            border-bottom: 2px solid #fd7e14;
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
        .info {
            color: blue;
            font-weight: bold;
        }
        .server-info {
            background: #fff8e1;
            padding: 15px;
            border-radius: 8px;
            margin: 10px 0;
            border-left: 4px solid #ff9800;
        }
    </style>
</head>
<body>
    <h1>🚀 Serveur 2 - TP3 Load Balancer</h1>
    
    <div class="server-info">
        <h2>📊 Informations du serveur</h2>
        <p><strong>IP du client :</strong> <?= $ip ?></p>
        <p><strong>Nom du serveur :</strong> <?= $host ?></p>
        <p><strong>IP du serveur :</strong> <?= $server_addr ?></p>
        <p><strong>Logiciel serveur :</strong> <?= $software ?></p>
        <p><strong>Heure de la requête :</strong> <?= date('Y-m-d H:i:s', $request_time) ?></p>
    </div>
    
    <div class="server-info">
        <h2>🗄️ Base de données MySQL</h2>
        <?= $status ?>
        <?= $db_status ?>
    </div>
    
    <div class="server-info">
        <h2>🌐 Informations du client</h2>
        <p><strong>User Agent :</strong> <?= htmlspecialchars($user_agent) ?></p>
    </div>
    
    <p><em>Actualisez la page pour voir l'équilibrage de charge en action !</em></p>
</body>
</html>
