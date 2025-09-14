# Installation de ttyd pour VHS

Pour utiliser VHS sur Windows, vous devez installer `ttyd` qui est une dépendance requise.

## Option 1 : Téléchargement direct

1. Allez sur [https://github.com/tsl0922/ttyd/releases](https://github.com/tsl0922/ttyd/releases)
2. Téléchargez la version Windows (ttyd.win32.exe ou ttyd.win64.exe)
3. Renommez le fichier en `ttyd.exe`
4. Placez-le dans un dossier de votre PATH (par exemple `C:\Windows\System32\`)

## Option 2 : Avec Chocolatey

```cmd
# Installer Chocolatey si pas déjà installé
# Puis installer ttyd
choco install ttyd
```

## Option 3 : Avec Scoop

```cmd
# Installer Scoop si pas déjà installé
# Puis installer ttyd
scoop install ttyd
```

## Vérification de l'installation

```cmd
ttyd --version
```

## Utilisation avec VHS

Une fois ttyd installé, vous pouvez utiliser VHS :

```cmd
vhs demo.tape
```

Cela générera un fichier `demo.gif` avec la démonstration de votre projet TP3.
