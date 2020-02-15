<!DOCTYPE html>
<html lang='fr'>
<?php
require 'utilities/database.php';
require 'utilities/soignant.php';

?>

<head>
    <meta charset='UTF-8'>
    <title>Exercice</title>
    <link rel="stylesheet" type="text.css" href="bootstrap/css/bootstrap.min.css">
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src='js/perso.js'></script>

</head>

<body>
    <h1>Libheros</h1>

    <div id="display"><h2>Chercher un professionnel</h2></div>
    <?php

    //traitement du formulaire :
    if (isset($_GET["todo"]) && $_GET["todo"] === "search") {
        if (isset($_POST["adresse"])) {
            $adresse = htmlspecialchars($_POST["adresse"]);
            echo "<input type='hidden' id='adresseJS' value='$adresse'/>";
        } else {
            echo "Erreur, l'adresse n'a pas été renseignée";
            return;
        }
        if (isset($_POST["soins"])) {
            $soins = $_POST["soins"];
            echo "<input type='hidden' id='soinsJS' value='$soins'/>";
        } else {
            echo "Erreur, les soins demandés n'ont pas étés renseignés";
            return;
        }
        
    } else {
    ?>
        <!--Formulaire de recherche-->
        <form action="index.php?todo=search" method="post">
            <label for="adresse">Renseignez votre adresse :</label>
            <input type="text" name="adresse" id="adresse" required placeholder="1 rue des Magasins, 67000 Strasbourg">
            <br>
            <label for="soins">Sélectionnez le type de soins dont vous avez besoin : </label>
            <select class="custom-select" name="soins" id="soins" required>
                <option value="1">Injections</option>
                <option value="2">Pansements</option>
                <option value="3">Perfusions</option>
                <option value="4">Dialyse</option>
            </select>
            <button type="submit" id="submit">Rechercher</button>
        </form>
    <?php
    } ?>


</body>