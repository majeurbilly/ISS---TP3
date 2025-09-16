# TP3 - Présentation pour le Professeur

## Texte à lire pour la vidéo de démonstration

---

**Professeur [Nom du professeur],**

Je vous présente mon travail pratique 3 sur la mise en place d'une infrastructure web avec équilibrage de charge. Cette démonstration dure environ 8 à 10 minutes et couvre tous les aspects techniques demandés dans les spécifications du TP.

## Introduction

L'objectif de ce travail était de créer une architecture web complète utilisant Docker Compose, avec les composants suivants :
- Un équilibreur de charge Nginx
- Deux serveurs web Apache identiques
- Deux serveurs PHP-FPM pour le traitement dynamique
- Deux serveurs MySQL pour la persistance des données

L'architecture respecte le principe d'isolation des services, où chaque composant fonctionne dans un conteneur indépendant, conformément aux exigences du TP.

## Démonstration technique

Je vais maintenant procéder à la démonstration complète de l'infrastructure en suivant mon script de test automatisé.

**[Exécuter ./demo_commands.sh]**

Comme vous pouvez le constater, l'infrastructure démarre correctement avec tous les conteneurs en statut "Up". Chaque service est configuré avec ses dépendances appropriées, garantissant un démarrage ordonné.

La vérification des statuts confirme que :
- Le port 80 est correctement mappé pour Nginx
- Les serveurs Apache sont opérationnels
- Les services PHP-FPM sont connectés
- Les bases de données MySQL sont initialisées avec leurs volumes persistants

## Test de l'équilibrage de charge

Je procède maintenant au test de l'équilibrage de charge avec cinq requêtes consécutives. Vous observerez que chaque requête est dirigée vers un serveur différent, démontrant l'efficacité de l'algorithme round-robin de Nginx.

Cette alternance visible prouve que l'équilibrage de charge fonctionne conformément aux spécifications. Chaque serveur web affiche son identité unique, permettant de distinguer clairement quelle instance traite chaque requête.

## Démonstration dans le navigateur

Pour une démonstration visuelle, j'ouvre maintenant le navigateur sur localhost. En rafraîchissant la page plusieurs fois, vous pouvez constater l'alternance entre les deux serveurs, confirmant que la répartition des charges est transparente pour l'utilisateur final.

## Analyse des journaux

L'analyse des journaux de tous les services confirme le bon fonctionnement de l'architecture :

**Logs Nginx** : Montrent la réception des requêtes et leur distribution vers les serveurs backend.

**Logs Apache** : Confirment que les deux serveurs web reçoivent bien des requêtes, validant l'équilibrage.

**Logs PHP-FPM** : Indiquent le traitement correct des requêtes PHP par chaque instance.

**Logs MySQL** : Démontrent les connexions à la base de données et la persistance des données.

Cette analyse prouve que toute la chaîne de traitement fonctionne correctement : Nginx distribue les requêtes vers Apache, qui communique avec PHP-FPM, qui accède aux données MySQL.

## Architecture réseau

L'inspection des réseaux Docker révèle la structure de l'infrastructure :

- Le réseau frontal connecte Nginx aux serveurs Apache
- Chaque réseau arrière isole un cluster complet (Apache + PHP + MySQL)

Cette séparation garantit la sécurité et l'isolation entre les différents services, conformément aux bonnes pratiques de sécurité.

## Nettoyage de l'infrastructure

Pour terminer la démonstration, je procède au nettoyage complet de l'infrastructure :

1. Arrêt de tous les conteneurs avec `docker-compose down`
2. Suppression des volumes de données avec l'option `--volumes`
3. Nettoyage des images non utilisées avec `docker system prune`

Cette procédure garantit qu'aucune donnée résiduelle ne reste sur le système, démontrant la facilité de gestion de l'infrastructure.

## Conclusion

Cette démonstration a validé tous les aspects techniques demandés dans le TP :

**Infrastructure complète** : Tous les services fonctionnent ensemble harmonieusement, avec une communication fluide entre les composants.

**Équilibrage de charge efficace** : Nginx distribue correctement les requêtes entre les deux serveurs, avec une alternance visible et mesurable.

**Architecture sécurisée** : Les réseaux Docker isolent les services selon les bonnes pratiques, avec une séparation claire entre les réseaux frontaux et arrière.

**Persistance des données** : Les volumes MySQL garantissent la sauvegarde des données entre les redémarrages.

**Gestion opérationnelle** : L'infrastructure peut être déployée, testée et nettoyée facilement grâce à Docker Compose.

Cette solution respecte intégralement les spécifications du TP et démontre une architecture de production robuste avec haute disponibilité et équilibrage de charge.

Je reste à votre disposition pour toute question ou clarification concernant cette implémentation.

**Merci pour votre attention.**

---

## Notes techniques pour l'enregistrement

### Points clés à souligner :
1. L'alternance visible entre les serveurs prouve l'équilibrage
2. Les logs confirment le fonctionnement de tous les services
3. L'architecture réseau respecte les bonnes pratiques
4. Le nettoyage complet démontre la facilité de gestion

### Timing recommandé :
- Introduction : 1 minute
- Démarrage et vérification : 2 minutes
- Test équilibrage : 2 minutes
- Analyse logs : 2 minutes
- Architecture et nettoyage : 2 minutes
- Conclusion : 1 minute

### Commandes à exécuter :
```bash
./demo_commands.sh
```

Suivre les pauses du script et expliquer chaque étape selon ce texte.

