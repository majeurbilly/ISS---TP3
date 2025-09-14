# TP3 - Démonstration Windows avec VHS
# Script optimisé pour Windows

# Configuration de base
Set FontSize 12
Set Width 1000
Set Height 700
Set Theme "Catppuccin Mocha"
Set Padding 15
Set Margin 15
Set MarginFill "#1e1e2e"
Set BorderRadius 6
Set WindowBar Colorful

# Démarrage de la démonstration
Type "echo === TP3 - Service Web avec Equilibrage de Charge ==="
Enter
Sleep 1s

Type "echo Demonstration de l'infrastructure Docker Compose"
Enter
Sleep 1s

# Vérification de Docker
Type "echo 🐳 Verification de Docker:"
Enter
Type "docker --version"
Enter
Type "docker-compose --version"
Enter
Sleep 1s

# Structure du projet
Type "echo 📁 Structure du projet:"
Enter
Type "dir /B"
Enter
Sleep 2s

# Démarrage des services
Type "echo 🚀 Demarrage des services Docker Compose:"
Enter
Type "docker-compose up -d"
Enter
Sleep 3s

# Vérification des conteneurs
Type "echo 📊 Etat des conteneurs:"
Enter
Type "docker-compose ps"
Enter
Sleep 2s

# Test de l'équilibrage de charge
Type "echo ⚖️ Test de l'equilibrage de charge:"
Enter
Type "echo Requetes multiples pour demontrer la repartition:"
Enter
Sleep 1s

# Requêtes multiples
Type "curl http://localhost"
Enter
Sleep 1s

Type "curl http://localhost"
Enter
Sleep 1s

Type "curl http://localhost"
Enter
Sleep 1s

Type "curl http://localhost"
Enter
Sleep 1s

# Vérification des logs
Type "echo 📋 Logs du service Nginx (equilibreur):"
Enter
Type "docker-compose logs --tail=5 nginx"
Enter
Sleep 2s

# Réseaux Docker
Type "echo 🌐 Reseaux Docker crees:"
Enter
Type "docker network ls"
Enter
Sleep 1s

# Message de fin
Type "echo ✅ Demonstration terminee!"
Enter
Type "echo Le projet TP3 demontre un equilibrage de charge avec:"
Enter
Type "echo - Nginx comme equilibreur"
Enter
Type "echo - 2 serveurs Apache identiques"
Enter
Type "echo - 2 instances PHP-FPM"
Enter
Type "echo - 2 bases de donnees MySQL"
Enter
Sleep 2s

# Capture finale
Screenshot demo-windows-final.png

# Sortie du GIF
Output demo-windows.gif
