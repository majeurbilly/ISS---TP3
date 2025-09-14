# TP3 - Script de Démonstration PowerShell
Write-Host "=== TP3 - Service Web avec Équilibrage de Charge ===" -ForegroundColor Cyan
Write-Host "Démonstration de l'infrastructure Docker Compose" -ForegroundColor Yellow
Write-Host ""

# Vérification de Docker
Write-Host "🐳 Vérification de Docker:" -ForegroundColor Green
docker --version
docker-compose --version
Write-Host ""

# Affichage de la structure du projet
Write-Host "📁 Structure du projet:" -ForegroundColor Green
Get-ChildItem -Name | ForEach-Object { Write-Host "  $_" }
Write-Host ""

# Démarrage des services
Write-Host "🚀 Démarrage des services Docker Compose:" -ForegroundColor Green
docker-compose up -d
Start-Sleep -Seconds 3

# Vérification des conteneurs
Write-Host "📊 État des conteneurs:" -ForegroundColor Green
docker-compose ps
Write-Host ""

# Test de l'équilibrage de charge
Write-Host "⚖️ Test de l'équilibrage de charge:" -ForegroundColor Green
Write-Host "Requêtes multiples pour démontrer la répartition:" -ForegroundColor Yellow
Write-Host ""

for ($i = 1; $i -le 4; $i++) {
    Write-Host "Requête $i :" -ForegroundColor Magenta
    try {
        $response = Invoke-WebRequest -Uri "http://localhost" -UseBasicParsing -TimeoutSec 5
        $content = $response.Content
        if ($content -match "Serveur [12]") {
            Write-Host "  → $($matches[0])" -ForegroundColor White
        }
    } catch {
        Write-Host "  → Erreur de connexion" -ForegroundColor Red
    }
    Start-Sleep -Seconds 1
}

Write-Host ""

# Vérification des logs
Write-Host "📋 Logs du service Nginx (équilibreur):" -ForegroundColor Green
docker-compose logs --tail=5 nginx
Write-Host ""

# Affichage des réseaux Docker
Write-Host "🌐 Réseaux Docker créés:" -ForegroundColor Green
docker network ls | Select-String "tp3"
Write-Host ""

# Message de fin
Write-Host "✅ Démonstration terminée!" -ForegroundColor Green
Write-Host "Le projet TP3 démontre un équilibrage de charge avec:" -ForegroundColor Yellow
Write-Host "- Nginx comme équilibreur" -ForegroundColor White
Write-Host "- 2 serveurs Apache identiques" -ForegroundColor White
Write-Host "- 2 instances PHP-FPM" -ForegroundColor White
Write-Host "- 2 bases de données MySQL" -ForegroundColor White
Write-Host ""

Write-Host "🧹 Pour arrêter les services:" -ForegroundColor Cyan
Write-Host "docker-compose down" -ForegroundColor Gray
Write-Host ""
Write-Host "Pour supprimer les volumes:" -ForegroundColor Cyan
Write-Host "docker-compose down -v" -ForegroundColor Gray
