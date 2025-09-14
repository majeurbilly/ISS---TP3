# Commandes de Démonstration TP3

Voici les commandes principales pour démontrer le projet TP3 :

## 🚀 Démarrage

```bash
# Démarrer tous les services
docker-compose up -d

# Vérifier l'état des conteneurs
docker-compose ps
```

## ⚖️ Test de l'Équilibrage de Charge

```bash
# Test avec curl (Linux/macOS)
curl http://localhost
curl http://localhost
curl http://localhost
curl http://localhost

# Test avec PowerShell (Windows)
Invoke-WebRequest -Uri "http://localhost" -UseBasicParsing
```

## 📊 Monitoring

```bash
# Voir les logs de Nginx
docker-compose logs nginx

# Voir les logs d'un serveur Apache
docker-compose logs tp3_httpd1
docker-compose logs tp3_httpd2

# Voir les logs PHP-FPM
docker-compose logs tp3_php1
docker-compose logs tp3_php2

# Voir les logs MySQL
docker-compose logs tp3_mysql1
docker-compose logs tp3_mysql2
```

## 🌐 Réseaux

```bash
# Lister les réseaux Docker
docker network ls

# Inspecter un réseau
docker network inspect tp3_front_net
```

## 🧹 Nettoyage

```bash
# Arrêter les services
docker-compose down

# Arrêter et supprimer les volumes
docker-compose down -v

# Supprimer les images
docker-compose down --rmi all
```

## 📈 Statistiques

```bash
# Statistiques des conteneurs
docker stats

# Statistiques en temps réel (Linux/macOS)
docker stats --no-stream
```

## 🔍 Debug

```bash
# Entrer dans un conteneur
docker-compose exec tp3_httpd1 bash
docker-compose exec tp3_mysql1 mysql -u tp3user -p tp3db

# Voir la configuration Nginx
docker-compose exec nginx cat /etc/nginx/conf.d/default.conf
```
