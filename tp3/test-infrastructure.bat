@echo off
REM Script de test pour l'infrastructure TP3 (Windows)
REM Usage: test-infrastructure.bat [start|stop|logs|test|clean]

set COMPOSE_FILE=docker-compose.yml

if "%1"=="start" goto start
if "%1"=="stop" goto stop
if "%1"=="logs" goto logs
if "%1"=="test" goto test
if "%1"=="clean" goto clean
if "%1"=="status" goto status
if "%1"=="health" goto health
goto help

:start
echo 🚀 Démarrage de l'infrastructure TP3...
docker-compose -f %COMPOSE_FILE% up -d
echo ✅ Infrastructure démarrée avec succès!
echo 🌐 Accédez à http://localhost pour tester
goto end

:stop
echo 🛑 Arrêt de l'infrastructure TP3...
docker-compose -f %COMPOSE_FILE% down
echo ✅ Infrastructure arrêtée!
goto end

:logs
echo 📋 Affichage des logs...
docker-compose -f %COMPOSE_FILE% logs -f
goto end

:test
echo 🧪 Test du load balancing...
echo Test de 10 requêtes pour vérifier l'équilibrage de charge:
for /L %%i in (1,1,10) do (
    echo Requête %%i:
    curl -s http://localhost | findstr "Serveur"
    timeout /t 1 /nobreak >nul
)
echo ✅ Test terminé!
goto end

:clean
echo 🧹 Nettoyage complet de l'infrastructure...
docker-compose -f %COMPOSE_FILE% down -v
docker system prune -f
echo ✅ Nettoyage terminé!
goto end

:status
echo 📊 Statut des conteneurs:
docker-compose -f %COMPOSE_FILE% ps
goto end

:health
echo 🏥 Vérification de la santé des services...
curl -s http://localhost/health >nul
if %errorlevel%==0 (
    echo ✅ Nginx: OK
) else (
    echo ❌ Nginx: ERREUR
)
docker-compose -f %COMPOSE_FILE% ps | findstr "Up" >nul
if %errorlevel%==0 (
    echo ✅ Conteneurs: OK
) else (
    echo ❌ Conteneurs: ERREUR
)
goto end

:help
echo Usage: %0 [COMMAND]
echo.
echo Commands:
echo   start   - Démarrer l'infrastructure
echo   stop    - Arrêter l'infrastructure
echo   logs    - Afficher les logs
echo   test    - Tester le load balancing
echo   clean   - Nettoyer complètement (arrêt + suppression volumes)
echo   status  - Afficher le statut des conteneurs
echo   health  - Vérifier la santé des services
echo.

:end
