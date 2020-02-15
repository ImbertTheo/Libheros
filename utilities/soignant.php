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
        
        
        $query = "SELECT * FROM `soignants` JOIN accepted_cares ON soignants.id=accepted_cares.idSoignant WHERE accepted_cares.idSoin = ? AND (1825*60*SQRT(SQUARE((?-soignants.office_longitude)*COS((?-soignants.office_latitude)/2))+SQUARE(?-soignants.office_latitude))<soignants.radius) ORDER BY 1825*60*SQRT(SQUARE((?-soignants.office_longitude)*COS((?-soignants.office_latitude)/2))+SQUARE(?-soignants.office_latitude)) ASC";
        $sth = $dbh->prepare($query);
        $sth->setFetchMode(PDO::FETCH_CLASS, 'Soignant');
        $sth->execute(array($soin,$lng,$lat,$lat,$lng,$lat,$lat));
        $soignants = $sth->fetchAll();
        $sth->closeCursor();
        return $soignants;
    }

    public function toString()
    {
        return $this->firstname . " " . $this->lastname;
    }
}
