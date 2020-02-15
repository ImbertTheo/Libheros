<?php
require '../utilities/database.php';
require '../utilities/soignant.php';
?>
<!DOCTYPE html>
<html>

<head>
</head>

<body>
    <?php
    $dbh = Database::connect();
    if (isset($_GET["lng"]) && isset($_GET["lat"]) && isset($_GET["soins"])) {
        $lng = $_GET["lng"];
        $lat = $_GET["lat"];
        $soins = $_GET["soins"];

        $liste = Soignant::search($dbh, $lng, $lat, $soins);
        echo "<h1>Professionnels pouvant vous prendre en charge : </h1>";
        foreach ($liste as $courant) {
            echo $courant->toString();
            echo "<br>";
        }
    } else {
        echo "Erreur : informations manquantes";
        return;
    }




    //déconnection de la base de donnée
    $dbh = null;
    ?>
</body>

</html>