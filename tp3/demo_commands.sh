#!/bin/bash

echo "========================================"
echo "    TP3 - Demo Video Commands"
echo "========================================"
echo

echo "[1/6] Démarrage de l'infrastructure..."
docker-compose up -d
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[2/6] Vérification du statut des conteneurs..."
docker-compose ps
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[3/6] Affichage des logs Nginx..."
docker-compose logs nginx
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[4/6] Test de l'équilibrage de charge (3 requêtes)..."
echo "Requête 1:"
curl http://localhost
echo
echo "Requête 2:"
curl http://localhost
echo
echo "Requête 3:"
curl http://localhost
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[5/6] Inspection des réseaux Docker..."
echo "Liste des réseaux:"
docker network ls
echo
echo "Inspection du réseau frontal:"
docker network inspect tp3_front_net
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "[6/6] Ouverture du navigateur pour la démo visuelle..."
echo "Ouvrez http://localhost dans votre navigateur"
echo "Rafraîchissez plusieurs fois pour voir l'alternance des serveurs"
echo
read -p "Appuyez sur Entrée pour continuer..."

echo "Démo terminée! Pour arrêter l'infrastructure:"
echo "docker-compose down"
