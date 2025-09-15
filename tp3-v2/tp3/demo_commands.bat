@echo off
echo ========================================
echo    TP3 - Demo Video Commands
echo ========================================
echo.

echo [1/6] Demarrage de l'infrastructure...
docker-compose up -d
echo.
pause

echo [2/6] Verification du statut des conteneurs...
docker-compose ps
echo.
pause

echo [3/6] Affichage des logs Nginx...
docker-compose logs nginx
echo.
pause

echo [4/6] Test de l'equilibrage de charge (3 requetes)...
echo Requete 1:
curl http://localhost
echo.
echo Requete 2:
curl http://localhost
echo.
echo Requete 3:
curl http://localhost
echo.
pause

echo [5/6] Inspection des reseaux Docker...
echo Liste des reseaux:
docker network ls
echo.
echo Inspection du reseau frontal:
docker network inspect tp3_front_net
echo.
pause

echo [6/6] Ouverture du navigateur pour la demo visuelle...
echo Ouvrez http://localhost dans votre navigateur
echo Rafraichissez plusieurs fois pour voir l'alternance des serveurs
echo.
pause

echo Demo terminee! Pour arreter l'infrastructure:
echo docker-compose down
pause
