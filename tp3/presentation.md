# TP3 - Scénario de Présentation Vidéo

## Scénario Complet (8-10 minutes)

---

### 🎬 **OUVERTURE (0:00 - 1:00)**

**[Présentation à la caméra]**

"Bonjour, je vais vous présenter mon travail pratique 3 sur la mise en place d'une infrastructure web avec équilibrage de charge.

L'objectif de ce TP était de créer une architecture complète avec :
- Un équilibreur de charge Nginx
- Deux serveurs Apache identiques
- Deux serveurs PHP-FPM
- Deux serveurs MySQL
- Le tout orchestré avec Docker Compose

L'architecture ressemble à ceci : les utilisateurs se connectent via Nginx qui distribue les requêtes entre deux serveurs Apache, chacun connecté à son propre serveur PHP et MySQL. Chaque serveur web affiche son identité pour prouver que l'équilibrage fonctionne.

Commençons par démarrer l'infrastructure !"

---

### 🚀 **DÉMARRAGE (1:00 - 3:00)**

**[Exécuter la commande]**
```bash
./demo_commands.sh
```

**[Pendant que ça démarre, expliquer]**
"Je lance mon script de démonstration qui va nous guider étape par étape. Vous voyez que Docker Compose démarre tous les conteneurs en parallèle. Chaque service est un conteneur indépendant comme demandé dans les exigences."

**[Quand la première pause arrive]**
"Parfait ! Tous les conteneurs sont maintenant en cours d'exécution. Vérifions leur statut..."

**[Pendant docker-compose ps]**
"Regardez, tous les conteneurs sont en statut 'Up'. Vous pouvez voir :
- Nginx sur le port 80
- Les deux serveurs Apache
- Les deux serveurs PHP-FPM
- Les deux serveurs MySQL avec leurs volumes persistants

L'infrastructure est maintenant opérationnelle !"

**[Attendre la pause de 10 secondes]**
"J'attends quelques secondes pour que MySQL soit complètement initialisé avant de tester l'équilibrage de charge."

---

### 🌐 **DÉMONSTRATION WEB (3:00 - 5:00)**

**[Pendant les tests curl]**
"Maintenant, testons l'équilibrage de charge avec 5 requêtes consécutives. Regardez attentivement les résultats..."

**[Pendant que les requêtes s'exécutent]**
"Vous voyez ? Chaque requête affiche un serveur différent ! Parfois c'est le Serveur 1, parfois le Serveur 2. Cela prouve que Nginx distribue bien les requêtes en alternance selon l'algorithme round-robin.

C'est exactement ce qu'on voulait démontrer : l'équilibrage de charge fonctionne parfaitement !"

**[Démonstration navigateur]**
"Maintenant, ouvrons le navigateur pour une démonstration visuelle. Je vais sur localhost..."

**[Rafraîchir plusieurs fois]**
"Regardez, quand je rafraîchis la page, vous pouvez voir que le contenu change. Parfois on voit 'Serveur 1' avec ses informations spécifiques, parfois 'Serveur 2'. 

C'est la preuve concrète que notre infrastructure fonctionne et que les utilisateurs sont répartis entre les deux serveurs de manière transparente."

---

### 📊 **ANALYSE DES LOGS (5:00 - 7:00)**

**[Pendant l'affichage des logs]**
"Maintenant, analysons les logs de tous nos services pour comprendre ce qui se passe en arrière-plan."

**[Logs Nginx]**
"Commençons par Nginx, notre équilibreur de charge. Vous voyez les requêtes entrantes et comment elles sont distribuées vers les serveurs backend."

**[Logs Apache]**
"Regardons les logs des serveurs Apache. Vous pouvez voir que les deux serveurs reçoivent bien des requêtes, confirmant que l'équilibrage fonctionne."

**[Logs PHP-FPM]**
"Les logs PHP-FPM montrent le traitement des requêtes PHP. Chaque serveur PHP traite les requêtes de son serveur Apache correspondant."

**[Logs MySQL]**
"Enfin, les logs MySQL montrent les connexions à la base de données. Chaque serveur PHP se connecte à sa propre base MySQL, garantissant l'isolation des données."

"Ces logs prouvent que toute la chaîne de traitement fonctionne correctement : Nginx → Apache → PHP → MySQL."

---

### 🏗️ **ARCHITECTURE ET RÉSEAUX (7:00 - 8:00)**

**[Pendant l'inspection des réseaux]**
"Examinons maintenant l'architecture réseau de notre infrastructure."

**[docker network ls]**
"Vous voyez nos trois réseaux Docker :
- Le réseau frontal pour Nginx et Apache
- Le réseau arrière 1 pour le premier cluster
- Le réseau arrière 2 pour le deuxième cluster"

**[Inspection des réseaux]**
"L'inspection des réseaux montre clairement la séparation :
- Le réseau frontal connecte Nginx aux deux serveurs Apache
- Chaque réseau arrière isole un cluster complet (Apache + PHP + MySQL)

Cette architecture garantit la sécurité et l'isolation entre les différents services."

---

### 🧹 **ARRÊT ET NETTOYAGE (8:00 - 9:00)**

**[Pendant l'arrêt]**
"Maintenant, démontrons comment arrêter proprement toute l'infrastructure."

**[docker-compose down]**
"Première étape : arrêter tous les conteneurs avec docker-compose down."

**[docker-compose down --volumes]**
"Deuxième étape : supprimer aussi les volumes de données avec l'option --volumes. Cela efface complètement les données MySQL."

**[docker system prune -f]**
"Troisième étape : nettoyer les images non utilisées avec docker system prune."

**[docker-compose ps]**
"Vérification finale : tous les conteneurs sont bien arrêtés. L'infrastructure est complètement nettoyée."

---

### 🎯 **CONCLUSION (9:00 - 10:00)**

**[Retour à la caméra]**

"Pour conclure, cette démonstration a prouvé que notre infrastructure web avec équilibrage de charge fonctionne parfaitement.

**Récapitulons ce qui a été accompli :**

✅ **Infrastructure complète et fonctionnelle** : Nginx, Apache, PHP-FPM et MySQL travaillent ensemble harmonieusement.

✅ **Équilibrage de charge efficace** : Les requêtes sont distribuées de manière transparente entre les deux serveurs.

✅ **Architecture sécurisée** : Les réseaux Docker isolent correctement les différents services.

✅ **Persistance des données** : Les volumes MySQL garantissent la sauvegarde des données.

✅ **Gestion propre** : L'infrastructure peut être démarrée et arrêtée proprement.

Cette architecture respecte toutes les exigences du TP et démontre une solution de production robuste avec haute disponibilité.

Merci pour votre attention !"

---

## 🎬 **NOTES POUR L'ENREGISTREMENT**

### **Timing :**
- Gardez un rythme naturel, ne vous précipitez pas
- Pausez entre chaque section pour respirer
- Laissez le temps aux commandes de s'exécuter

### **Techniques de présentation :**
- Regardez la caméra pour l'introduction et la conclusion
- Montrez l'écran pendant les démonstrations techniques
- Expliquez pendant que les commandes s'exécutent
- Pointez du doigt les éléments importants à l'écran

### **Points clés à bien montrer :**
1. L'alternance visible entre Serveur 1 et Serveur 2
2. Les logs de tous les services
3. La séparation des réseaux
4. Le nettoyage complet à la fin

### **Si quelque chose ne fonctionne pas :**
- Restez calme et expliquez le problème
- Montrez les logs d'erreur
- Essayez de redémarrer si nécessaire
- C'est normal d'avoir des petits problèmes techniques

---

## 🎯 **CHECKLIST AVANT ENREGISTREMENT**

- [ ] Tester le script `demo_commands.sh` au moins une fois
- [ ] Vérifier que tous les services démarrent correctement
- [ ] S'assurer que l'équilibrage de charge fonctionne
- [ ] Préparer l'écran avec une taille de terminal lisible
- [ ] Fermer toutes les autres applications
- [ ] Vérifier l'éclairage et l'angle de la caméra
- [ ] Avoir un plan B si quelque chose ne fonctionne pas

**Bonne chance pour votre enregistrement ! 🎥**