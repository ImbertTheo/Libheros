# Libheros

Pour lancer le site : 
- installer xampp
- placer le dépot dans le sous dossier htdocs de xampp (/opt/lampp/htdocs sous linux, C:/xampp/htdocs sous windows)
- avec xampp, lancer apache et pmysql
- ouvrir localhost/phpmyadmin dans un navigateur et importer libheros.sql
- dans utilities/database.php, adapter la valeur dbname au nom donné à la base de donnée lors de l'importation
- ouvrir localhost/chemin/vers/Libheros dans un navigateur

Remarques :
il est possible qu'il faille mettre à jour mysql pour que le site fonctionne correctement :
executer mysql_upgrade dans le sous dossier bin de xampp
