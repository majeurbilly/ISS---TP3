# TP3 - Mise en place d'un service Web avec équilibrage de charge

## 📋 Informations du projet

- **Nom du projet :** TP3 - Infrastructure Web avec Load Balancer
- **Date :** Décembre 2024
- **Description :** Mise en place d'une infrastructure web complète avec équilibrage de charge utilisant Docker Compose

## 🏗️ Architecture

Ce projet implémente une architecture web avec équilibrage de charge selon le schéma suivant :

```
Client → Nginx (Load Balancer) → Apache Server 1/2 → PHP-FPM → MySQL
```

### Composants

- **Nginx** : Équilibreur de charge (Load Balancer)
- **Apache (httpd)** : Serveurs web (2 instances)
- **PHP-FPM** : Processeurs FastCGI (2 instances)
- **MySQL** : Bases de données (2 instances)

## 🚀 Démarrage rapide

### Prérequis

- Docker
- Docker Compose

### Installation et lancement

1. **Cloner le projet :**
   ```bash
   git clone <votre-repo>
   cd tp3
   ```

2. **Lancer l'infrastructure :**
   ```bash
   docker-compose up -d
   ```

3. **Accéder au site :**
   - URL : http://localhost ou http://www.tp3.com
   - Actualisez la page pour voir l'équilibrage de charge en action

### Commandes utiles

```bash
# Voir les logs
docker-compose logs -f

# Voir les logs d'un service spécifique
docker-compose logs -f nginx
docker-compose logs -f tp3_httpd1
docker-compose logs -f tp3_mysql1

# Arrêter les services
docker-compose down

# Arrêter et supprimer les volumes
docker-compose down -v

# Reconstruire les images
docker-compose build --no-cache
```

## 📁 Structure du projet

```
tp3/
├── docker-compose.yml          # Configuration principale
├── nginx/
│   ├── Dockerfile             # Image Nginx
│   └── default.conf           # Configuration du load balancer
├── serveur1/
│   ├── Dockerfile             # Image Apache (optionnel)
│   ├── httpd.conf             # Configuration Apache
│   └── www/
│       └── index.php          # Contenu web
├── serveur2/
│   ├── Dockerfile             # Image Apache (optionnel)
│   ├── httpd.conf             # Configuration Apache
│   └── www/
│       └── index.php          # Contenu web
├── php1/
│   ├── Dockerfile             # Image PHP-FPM
│   └── www.conf               # Configuration PHP-FPM
├── php2/
│   ├── Dockerfile             # Image PHP-FPM
│   └── www.conf               # Configuration PHP-FPM
├── mysql1/
│   ├── Dockerfile             # Image MySQL (optionnel)
│   └── init.sql               # Script d'initialisation
└── mysql2/
    ├── Dockerfile             # Image MySQL (optionnel)
    └── init.sql               # Script d'initialisation
```

## 🔧 Configuration

### Nginx (Load Balancer)

- **Port :** 80
- **Upstream :** Répartit les requêtes entre tp3_httpd1 et tp3_httpd2
- **Health check :** /health

### Apache Servers

- **Port :** 80 (interne)
- **Configuration :** Proxy vers PHP-FPM
- **Contenu :** Monté depuis ./serveur1/www/ et ./serveur2/www/

### PHP-FPM

- **Port :** 9000
- **Extensions :** PDO, PDO_MySQL
- **Configuration :** Pool dynamique

### MySQL

- **Port :** 3306 (interne)
- **Base de données :** tp3db
- **Utilisateur :** tp3user
- **Volumes persistants :** mysql1_data, mysql2_data

## 🌐 Réseaux

- **front_net :** Réseau frontal (Nginx ↔ Apache)
- **back1_net :** Réseau arrière 1 (Apache1 ↔ PHP1 ↔ MySQL1)
- **back2_net :** Réseau arrière 2 (Apache2 ↔ PHP2 ↔ MySQL2)

## 🧪 Tests et validation

### Vérification du load balancing

1. Accédez à http://localhost
2. Actualisez la page plusieurs fois
3. Observez l'alternance entre "Serveur 1" et "Serveur 2"

### Vérification des bases de données

- Chaque serveur affiche sa connexion MySQL respective
- Les données sont persistantes grâce aux volumes Docker

### Logs et monitoring

```bash
# Logs Nginx
docker-compose logs nginx

# Logs Apache
docker-compose logs tp3_httpd1
docker-compose logs tp3_httpd2

# Logs PHP-FPM
docker-compose logs tp3_php1
docker-compose logs tp3_php2

# Logs MySQL
docker-compose logs tp3_mysql1
docker-compose logs tp3_mysql2
```

## 📹 Vidéo de démonstration

[Lien vers votre vidéo de démonstration - à ajouter]

## 📚 Références

- [Documentation Docker](https://docs.docker.com/)
- [Documentation Docker Compose](https://docs.docker.com/compose/)
- [Documentation Nginx](https://nginx.org/en/docs/)
- [Documentation Apache HTTP Server](https://httpd.apache.org/docs/)
- [Documentation PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
- [Documentation MySQL](https://dev.mysql.com/doc/)

## 👥 Auteurs

- [Votre nom]
- [Nom de votre partenaire si applicable]

## 📄 Licence

Ce projet est réalisé dans le cadre du cours [Nom du cours] - [Institution]
