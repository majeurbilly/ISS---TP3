# Guide de déploiement - TP3

## 🎯 Objectifs atteints

### ✅ Load Balancer (Nginx)
- **Contexte upstream** : Configuration correcte avec tp3_httpd1 et tp3_httpd2
- **Contexte server** : Proxy pass vers le backend avec headers appropriés
- **Health check** : Endpoint /health disponible
- **Logs** : Configuration des logs d'accès et d'erreur

### ✅ Serveurs Web (Apache)
- **Configuration httpd.conf** : Montage par point de montage
- **Proxy vers PHP-FPM** : Configuration correcte des handlers
- **Contenu web** : Montage depuis le répertoire hôte
- **Identification serveur** : Pages distinctes pour serveur 1 et 2

### ✅ PHP-FPM
- **Extensions MySQL** : PDO et PDO_MySQL installés
- **Configuration** : Pools dynamiques configurés
- **Communication** : Liaison correcte avec Apache et MySQL

### ✅ MySQL
- **Volumes persistants** : Données sauvegardées sur l'hôte
- **Initialisation** : Scripts d'initialisation automatiques
- **Réseaux** : Communication sécurisée via réseaux arrière

## 🚀 Instructions de déploiement

### 1. Préparation de l'environnement

```bash
# Vérifier Docker et Docker Compose
docker --version
docker-compose --version

# Cloner le projet
git clone <votre-repo>
cd tp3
```

### 2. Lancement de l'infrastructure

```bash
# Démarrer tous les services
docker-compose up -d

# Vérifier le statut
docker-compose ps
```

### 3. Tests de validation

```bash
# Test du load balancing
curl http://localhost
# Actualiser plusieurs fois pour voir l'alternance

# Test de santé
curl http://localhost/health

# Vérification des logs
docker-compose logs nginx
docker-compose logs tp3_httpd1
docker-compose logs tp3_mysql1
```

### 4. Monitoring et maintenance

```bash
# Voir les logs en temps réel
docker-compose logs -f

# Redémarrer un service
docker-compose restart nginx

# Mise à jour des images
docker-compose pull
docker-compose up -d
```

## 🔍 Points de validation

### Load Balancer
- [ ] Nginx démarre correctement
- [ ] Configuration upstream active
- [ ] Répartition des requêtes entre serveurs
- [ ] Headers proxy corrects

### Serveurs Web
- [ ] Apache démarre sur les deux serveurs
- [ ] Configuration httpd.conf montée
- [ ] Contenu web accessible
- [ ] Identification serveur visible

### PHP-FPM
- [ ] Processeurs PHP démarrent
- [ ] Communication avec Apache
- [ ] Extensions MySQL chargées
- [ ] Traitement des fichiers PHP

### MySQL
- [ ] Bases de données initialisées
- [ ] Volumes persistants créés
- [ ] Connexions PHP fonctionnelles
- [ ] Données accessibles

## 📊 Métriques de performance

### Ressources système
- **RAM** : ~2GB recommandés
- **CPU** : 2 cœurs minimum
- **Stockage** : 5GB pour les volumes

### Temps de démarrage
- **Nginx** : ~5 secondes
- **Apache** : ~10 secondes
- **PHP-FPM** : ~15 secondes
- **MySQL** : ~30 secondes

## 🛠️ Dépannage

### Problèmes courants

1. **Port 80 occupé**
   ```bash
   # Vérifier les processus utilisant le port 80
   netstat -tulpn | grep :80
   # Arrêter le service conflictuel
   sudo systemctl stop apache2
   ```

2. **Conteneurs ne démarrent pas**
   ```bash
   # Vérifier les logs
   docker-compose logs
   # Nettoyer et redémarrer
   docker-compose down -v
   docker-compose up -d
   ```

3. **Erreurs de connexion MySQL**
   ```bash
   # Vérifier les logs MySQL
   docker-compose logs tp3_mysql1
   # Attendre l'initialisation complète
   sleep 30
   ```

### Commandes de diagnostic

```bash
# Statut des conteneurs
docker-compose ps

# Utilisation des ressources
docker stats

# Logs spécifiques
docker-compose logs nginx
docker-compose logs tp3_httpd1
docker-compose logs tp3_mysql1

# Test de connectivité
docker-compose exec nginx curl http://tp3_httpd1
docker-compose exec tp3_php1 ping tp3_mysql1
```

## 📝 Notes importantes

- Les volumes MySQL sont persistants et conservent les données entre les redémarrages
- Le load balancing utilise l'algorithme round-robin par défaut
- Les logs sont configurés pour faciliter le debugging
- L'infrastructure est conçue pour être facilement extensible

## 🎥 Démonstration

Pour la démonstration vidéo, montrer :
1. Démarrage des conteneurs
2. Accès au site web
3. Alternance entre serveurs (load balancing)
4. Vérification des logs
5. Test de la base de données
6. Arrêt et nettoyage
