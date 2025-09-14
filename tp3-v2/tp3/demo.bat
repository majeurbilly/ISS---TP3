@echo off
echo === TP3 - Service Web avec Equilibrage de Charge ===
echo Demonstration de l'infrastructure Docker Compose
echo.

echo 🐳 Verification de Docker:
docker --version
docker-compose --version
echo.

echo 📁 Structure du projet:
dir /B
echo.

echo 🚀 Demarrage des services Docker Compose:
docker-compose up -d
timeout /t 3 /nobreak >nul

echo 📊 Etat des conteneurs:
docker-compose ps
echo.

echo ⚖️ Test de l'equilibrage de charge:
echo Requetes multiples pour demontrer la repartition:
echo.

for /L %%i in (1,1,4) do (
    echo Requete %%i :
    curl -s http://localhost | findstr "Serveur"
    timeout /t 1 /nobreak >nul
)

echo.
echo 📋 Logs du service Nginx (equilibreur):
docker-compose logs --tail=5 nginx
echo.

echo 🌐 Reseaux Docker crees:
docker network ls | findstr "tp3"
echo.

echo ✅ Demonstration terminee!
echo Le projet TP3 demontre un equilibrage de charge avec:
echo - Nginx comme equilibreur
echo - 2 serveurs Apache identiques
echo - 2 instances PHP-FPM
echo - 2 bases de donnees MySQL
echo.

echo 🧹 Pour arreter les services:
echo docker-compose down
echo.
echo Pour supprimer les volumes:
echo docker-compose down -v
