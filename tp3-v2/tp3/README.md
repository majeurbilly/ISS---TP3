<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/majeurbilly/ISS---TP3">
    <img src="https://img.icons8.com/color/100/000000/docker.png" alt="Docker Logo" width="100" height="100">
  </a>

  <h3 align="center">TP3 - Service Web avec Équilibrage de Charge 🚀</h3>

  <p align="center">
    Infrastructure web complète avec équilibrage de charge utilisant Docker Compose
    <br />
    <a href="#about"><strong>Explorer l'architecture »</strong></a>
      <br />
      <br />
      <a href="https://github.com/majeurbilly/ISS---TP3/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Signaler un Bug</a>
      ·
      <a href="https://github.com/majeurbilly/ISS---TP3/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Demander une Fonctionnalité</a>
      ·
      <a href="https://github.com/majeurbilly/ISS---TP3/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+">Poser une Question</a>
  </p>
</div>



  ## Table des Matières
  <ol>
    <li>
      <a href="#about">À Propos</a>
      <ul>
        <li><a href="#built-with">Technologies Utilisées</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Démarrage</a>
      <ul>
        <li><a href="#prerequisites">Prérequis</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Utilisation</a></li>
    <li><a href="#monitoring-tools-overview">Aperçu des Outils de Surveillance</a></li>
    <li><a href="#authors--contributors">Auteurs et Contributeurs</a></li>
    <li><a href="#acknowledgments">Remerciements</a></li>
  </ol>



<!-- À PROPOS DU PROJET -->
## À Propos

Ce projet implémente une architecture de service web avec équilibrage de charge selon le schéma suivant :

```
www.tp3.com → Nginx (Équilibreur) → Serveur Apache 1/2 → PHP-FPM → MySQL
```

### Architecture des Réseaux

- **front_net** : Réseau frontal pour la communication externe
- **back1_net** : Réseau arrière pour serveur 1 (Apache + PHP + MySQL)
- **back2_net** : Réseau arrière pour serveur 2 (Apache + PHP + MySQL)

<details>
 <summary>
    <a href="#images">
      <img src="https://img.icons8.com/color/40/000000/docker.png" alt="Architecture Docker" height="40">
    </a>
 </summary>
<br>
🏗️ Architecture Docker Compose  
<img src="https://img.icons8.com/color/400/000000/docker.png" alt="Architecture Docker">

</details>

### Technologies Utilisées

- **Docker Compose** - Orchestration des conteneurs
- **Nginx** - Équilibreur de charge (Load Balancer)
- **Apache (httpd)** - Serveurs web (2 instances identiques)
- **PHP-FPM** - Processeurs PHP FastCGI (2 instances)
- **MySQL** - Bases de données (2 instances avec volumes persistants)

## Démarrage

### Prérequis

Pour travailler avec ce projet, vous devez avoir :

- **Docker Desktop** - Version 4.0 ou plus récente
- **Docker Compose** - Version 2.0 ou plus récente
- **Git** - Pour cloner le dépôt

### Installation

1. Ouvrez votre **terminal**.
2. Clonez le dépôt :
   ```bash
   git clone https://github.com/majeurbilly/ISS---TP3.git
   ```
3. Naviguez vers le répertoire du projet :
   ```bash
   cd ISS---TP3
   ```
4. Démarrez Docker Desktop et attendez qu'il s'initialise
5. Lancez le programme :
   ```bash
   docker-compose up -d
   ```

## Utilisation

### Services Backend

1. Dans le répertoire racine du projet, démarrez tous les services :
   ```bash
   docker-compose up -d
   ```

2. Vérifiez le statut des conteneurs :
   ```bash
   docker-compose ps
   ```

3. Consultez les logs :
   ```bash
   docker-compose logs nginx
   docker-compose logs tp3_httpd1
   docker-compose logs tp3_httpd2
   ```

4. Testez l'équilibrage de charge :
   ```bash
   curl http://localhost
   # Rafraîchissez plusieurs fois pour voir l'alternance des serveurs
   ```

5. Arrêtez et nettoyez :
   ```bash
   docker-compose down
   ```

### Test d'Équilibrage de Charge

1. Accéder à http://localhost (ou www.tp3.com si configuré dans /etc/hosts)
2. Rafraîchir la page plusieurs fois
3. Observer l'alternance entre "Serveur 1" et "Serveur 2"
4. Vérifier la connexion à la base de données sur chaque serveur

## Aperçu des Outils de Surveillance

### **Logs Docker Compose**
```bash
# Voir tous les logs
docker-compose logs

# Voir les logs d'un service spécifique
docker-compose logs nginx
docker-compose logs tp3_httpd1
docker-compose logs tp3_php1
docker-compose logs tp3_mysql1
```

### **Statut des Conteneurs**
```bash
# Vérifier les conteneurs en cours d'exécution
docker-compose ps

# Vérifier la santé des conteneurs
docker-compose top
```

### **Inspection des Réseaux**
```bash
# Lister les réseaux
docker network ls

# Inspecter un réseau spécifique
docker network inspect tp3_front_net
docker network inspect tp3_back1_net
docker network inspect tp3_back2_net
```

## Auteurs et Contributeurs

- **Billy Major** - *Travail initial* - [majeurbilly](https://github.com/majeurbilly)

## Remerciements

Remerciements :

* [Documentation Docker](https://docs.docker.com/)
* [Documentation Nginx](https://nginx.org/en/docs/)
* [Documentation Apache HTTP Server](https://httpd.apache.org/docs/)
* [Documentation PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
* [Documentation MySQL](https://dev.mysql.com/doc/)
* [Documentation Docker Compose](https://docs.docker.com/compose/)

<p align="right">(<a href="#readme-top">retour en haut</a>)</p>  
