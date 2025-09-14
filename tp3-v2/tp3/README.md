# TP3 - Service Web avec Équilibrage de Charge

## 📋 Informations du Projet
- **Nom du projet** : TP3 - Mise en place d'un service Web avec Docker Compose
- **Date** : Décembre 2024
- **Description** : Infrastructure web complète avec équilibrage de charge utilisant Nginx, Apache, PHP-FPM et MySQL

## 🏗️ Architecture

Ce projet implémente une architecture de service web avec équilibrage de charge selon le schéma suivant :

```
www.tp3.com → Nginx (Équilibreur) → Serveur Apache 1/2 → PHP-FPM → MySQL
```

### 🔧 Composants

- **Nginx** : Équilibreur de charge (Load Balancer)
- **Apache (httpd)** : Serveurs web (2 instances identiques)
- **PHP-FPM** : Processeurs PHP FastCGI (2 instances)
- **MySQL** : Bases de données (2 instances avec volumes persistants)

### 🌐 Réseaux

- **front_net** : Réseau frontal pour la communication externe
- **back1_net** : Réseau arrière pour serveur 1 (Apache + PHP + MySQL)
- **back2_net** : Réseau arrière pour serveur 2 (Apache + PHP + MySQL)

## 📁 Structure des Fichiers

```
tp3/
├── docker-compose.yml          # Configuration principale Docker Compose
├── nginx/
│   ├── Dockerfile             # Image Nginx personnalisée
│   └── default.conf           # Configuration Nginx avec upstream
├── serveur1/
│   ├── httpd.conf             # Configuration Apache pour serveur 1
│   └── www/
│       └── index.php          # Page web serveur 1
├── serveur2/
│   ├── httpd.conf             # Configuration Apache pour serveur 2
│   └── www/
│       └── index.php          # Page web serveur 2
├── php1/
│   ├── Dockerfile             # Image PHP-FPM pour serveur 1
│   └── www.conf               # Configuration PHP-FPM
├── php2/
│   ├── Dockerfile             # Image PHP-FPM pour serveur 2
│   └── www.conf               # Configuration PHP-FPM
├── mysql1/                    # (Répertoire non utilisé - utilise image officielle)
└── mysql2/                    # (Répertoire non utilisé - utilise image officielle)
```

## ⚙️ Configuration

### 🔄 Nginx (Équilibreur de Charge)
- **Upstream** : Définit les serveurs backend (tp3_httpd1, tp3_httpd2)
- **Server** : Écoute sur le port 80, proxy vers le backend
- **Équilibrage** : Distribution en round-robin par défaut

### 🌐 Apache (httpd)
- **Modules** : proxy, proxy_fcgi pour communication avec PHP-FPM
- **DocumentRoot** : /var/www/html
- **Proxy** : Redirection des fichiers .php vers PHP-FPM

### 🐘 PHP-FPM
- **Listen** : 0.0.0.0:9000
- **Extensions** : pdo, pdo_mysql pour connexion MySQL
- **Gestionnaire de processus** : Configuration dynamique

### 🗄️ MySQL
- **Base de données** : tp3db
- **Utilisateur** : tp3user / tp3pass
- **Volumes persistants** : mysql1_data, mysql2_data

## 🚀 Utilisation

### ▶️ Démarrage des Services
```bash
docker-compose up -d
```

### 🔍 Vérification du Fonctionnement
```bash
# Vérifier les conteneurs
docker-compose ps

# Voir les logs
docker-compose logs nginx
docker-compose logs tp3_httpd1
docker-compose logs tp3_httpd2

# Tester l'accès
curl http://localhost
```

### ⏹️ Arrêt et Nettoyage
```bash
# Arrêter les services
docker-compose down

# Arrêter et supprimer les volumes
docker-compose down -v

# Supprimer les images
docker-compose down --rmi all
```

## 🧪 Test de l'Équilibrage de Charge

1. Accéder à http://localhost (ou www.tp3.com si configuré dans /etc/hosts)
2. Rafraîchir la page plusieurs fois
3. Observer l'alternance entre "Serveur 1" et "Serveur 2"
4. Vérifier la connexion à la base de données sur chaque serveur

## 📹 Démonstration avec VHS

Ce projet inclut une démonstration automatisée créée avec [VHS](https://github.com/charmbracelet/vhs) - un outil pour créer des enregistrements de terminal.

### 🎬 Génération de la Démonstration

#### Option 1 : Script de Démonstration (Windows)

```cmd
# Script batch (recommandé)
demo.bat

# Ou script PowerShell
.\demo-simple.ps1
```

#### Option 2 : VHS pour GIF animé

Pour générer un GIF de démonstration avec VHS :

```bash
# Installer VHS (si pas déjà installé)
# Sur macOS avec Homebrew :
brew install vhs

# Sur Linux/Windows avec Go :
go install github.com/charmbracelet/vhs@latest

# Installer ttyd (requis pour VHS sur Windows)
# Voir INSTALL-TTYD.md pour les instructions détaillées

# Générer la démonstration
vhs demo.tape

# Ou version optimisée pour Windows
vhs demo-windows.tape
```

Le script `demo.tape` démontre :
- ✅ Démarrage des services Docker Compose
- ✅ Vérification de l'état des conteneurs
- ✅ Test de l'équilibrage de charge avec des requêtes multiples
- ✅ Alternance entre les serveurs 1 et 2
- ✅ Vérification de la connectivité aux bases de données
- ✅ Affichage des logs et statistiques

### 📸 Capture d'Écran

Le script VHS génère également une capture d'écran finale (`demo-final.png`) et un GIF animé (`demo.gif`) montrant le fonctionnement complet de l'infrastructure.

## 📚 Sites de Référence

- [Documentation Docker](https://docs.docker.com/)
- [Documentation Nginx](https://nginx.org/en/docs/)
- [Documentation Apache HTTP Server](https://httpd.apache.org/docs/)
- [Documentation PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
- [Documentation MySQL](https://dev.mysql.com/doc/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

## 🎯 Objectifs Atteints

✅ Installation complète d'un site Web avec équilibrage de charge  
✅ Utilisation de Nginx comme équilibreur/répartiteur de charge  
✅ Utilisation d'Apache (httpd) comme serveur de contenus  
✅ Utilisation de php-fpm comme FastCGI  
✅ Utilisation de MySQL comme serveur de base de données  
✅ Services en conteneurs indépendants  
✅ Serveurs Web identiques avec distinction visuelle  
✅ Réseaux avant et arrière configurés  
✅ Configuration httpd.conf montée par point de montage  
✅ Contenu des serveurs httpd monté par point de montage  
✅ Volumes de données MySQL persistants  
