<?php
class Soignant
{
    public $id;
    public $lastname;
    public $firstname;
    public $office_latitude;
    public $office_longitutde;
    public $radius;


    public static function search($dbh, $lng, $lat, $soin)
    {
        
        
        $query = "SELECT * FROM `soignants` JOIN accepted_cares ON soignants.id=accepted_cares.idSoignant WHERE accepted_cares.idSoin = ? AND distanceCoord(?,?,soignants.office_longitude,soignants.office_latitude)<soignants.radius ORDER BY distanceCoord(?,?,soignants.office_longitude,soignants.office_latitude) ASC";
        $sth = $dbh->prepare($query);
        $sth->setFetchMode(PDO::FETCH_CLASS, 'Soignant');
        $sth->execute(array($soin, $lng, $lat, $lng, $lat));
        $soignants = $sth->fetchAll();
        $sth->closeCursor();
        return $soignants;
    }

    public function toString()
    {
        return $this->firstname . " " . $this->lastname;
    }
}
