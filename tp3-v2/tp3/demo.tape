# TP3 - Démonstration de l'Équilibrage de Charge
# Script VHS pour démontrer le projet TP3

# Configuration de base
Set FontSize 14
Set Width 1200
Set Height 800
Set Theme "Catppuccin Mocha"
Set Padding 20
Set Margin 20
Set MarginFill "#1e1e2e"
Set BorderRadius 8
Set WindowBar Colorful

# Démarrage de la démonstration
Type "echo '=== TP3 - Service Web avec Équilibrage de Charge ==='"
Enter
Sleep 1s

Type "echo 'Démonstration de l'infrastructure Docker Compose'"
Enter
Sleep 1s

# Affichage de la structure du projet
Type "echo '📁 Structure du projet:'"
Enter
Type "dir /B"
Enter
Sleep 2s

# Vérification de Docker
Type "echo '🐳 Vérification de Docker:'"
Enter
Type "docker --version"
Enter
Type "docker-compose --version"
Enter
Sleep 1s

# Démarrage des services
Type "echo '🚀 Démarrage des services Docker Compose:'"
Enter
Type "docker-compose up -d"
Enter
Sleep 3s

# Vérification des conteneurs
Type "echo '📊 État des conteneurs:'"
Enter
Type "docker-compose ps"
Enter
Sleep 2s

# Test de l'équilibrage de charge
Type "echo '⚖️ Test de l'équilibrage de charge:'"
Enter
Type "echo 'Requêtes multiples pour démontrer la répartition:'"
Enter
Sleep 1s

# Première requête
Type "curl -s http://localhost"
Enter
Sleep 1s

# Deuxième requête
Type "curl -s http://localhost"
Enter
Sleep 1s

# Troisième requête
Type "curl -s http://localhost"
Enter
Sleep 1s

# Quatrième requête
Type "curl -s http://localhost"
Enter
Sleep 1s

# Vérification des logs
Type "echo '📋 Logs du service Nginx (équilibreur):'"
Enter
Type "docker-compose logs --tail=5 nginx"
Enter
Sleep 2s

# Affichage des réseaux Docker
Type "echo '🌐 Réseaux Docker créés:'"
Enter
Type "docker network ls"
Enter
Sleep 1s

# Message de fin
Type "echo '✅ Démonstration terminée!'"
Enter
Type "echo 'Le projet TP3 démontre un équilibrage de charge avec:'"
Enter
Type "echo '- Nginx comme équilibreur'"
Enter
Type "echo '- 2 serveurs Apache identiques'"
Enter
Type "echo '- 2 instances PHP-FPM'"
Enter
Type "echo '- 2 bases de données MySQL'"
Enter
Sleep 2s

# Capture finale
Screenshot demo-final.png

# Sortie du GIF
Output demo.gif
