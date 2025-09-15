#!/bin/bash

echo "========================================"
echo "    TP3 - Demo Video Commands"
echo "========================================"
echo

echo "[1/8] Démarrage de l'infrastructure..."
docker-compose up -d
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[2/8] Vérification du statut des conteneurs..."
docker-compose ps
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[3/8] Attente que tous les services soient prêts..."
echo "Attente de 10 secondes pour que MySQL soit complètement initialisé..."
sleep 10
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[4/8] Test de l'équilibrage de charge (5 requêtes pour voir l'alternance)..."
echo "Requête 1:"
curl -s http://localhost | grep -E "(Serveur|Server|Hostname|IP)"
echo
echo "Requête 2:"
curl -s http://localhost | grep -E "(Serveur|Server|Hostname|IP)"
echo
echo "Requête 3:"
curl -s http://localhost | grep -E "(Serveur|Server|Hostname|IP)"
echo
echo "Requête 4:"
curl -s http://localhost | grep -E "(Serveur|Server|Hostname|IP)"
echo
echo "Requête 5:"
curl -s http://localhost | grep -E "(Serveur|Server|Hostname|IP)"
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[5/8] Affichage des logs des différents services..."
echo "=== Logs Nginx (Load Balancer) ==="
docker-compose logs --tail=10 nginx
echo
echo "=== Logs Serveur Apache 1 ==="
docker-compose logs --tail=5 tp3_httpd1
echo
echo "=== Logs Serveur Apache 2 ==="
docker-compose logs --tail=5 tp3_httpd2
echo
echo "=== Logs PHP-FPM 1 ==="
docker-compose logs --tail=5 tp3_php1
echo
echo "=== Logs PHP-FPM 2 ==="
docker-compose logs --tail=5 tp3_php2
echo
echo "=== Logs MySQL 1 ==="
docker-compose logs --tail=5 tp3_mysql1
echo
echo "=== Logs MySQL 2 ==="
docker-compose logs --tail=5 tp3_mysql2
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[6/8] Inspection des réseaux Docker..."
echo "Liste des réseaux:"
docker network ls
echo
echo "Inspection du réseau frontal:"
docker network inspect tp3_front_net | grep -A 5 -B 5 "Containers"
echo
echo "Inspection du réseau arrière 1:"
docker network inspect tp3_back1_net | grep -A 5 -B 5 "Containers"
echo
echo "Inspection du réseau arrière 2:"
docker network inspect tp3_back2_net | grep -A 5 -B 5 "Containers"
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[7/8] Démonstration visuelle dans le navigateur..."
echo "Ouvrez http://localhost dans votre navigateur"
echo "Rafraîchissez plusieurs fois pour voir l'alternance des serveurs"
echo "Notez les différences entre Serveur 1 et Serveur 2"
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[8/8] Arrêt et nettoyage de l'infrastructure..."
echo "Arrêt des conteneurs..."
docker-compose down
echo
echo "Suppression des volumes de données..."
docker-compose down --volumes
echo
echo "Nettoyage des images non utilisées..."
docker system prune -f
echo
echo "Vérification que tout est arrêté..."
docker-compose ps
echo
echo "Démo terminée!"
