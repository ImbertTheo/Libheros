$(document).ready(function () {
    var longitude="0";
    var latitude="0";

    //récupération des coordonnées correspondant à l'adresse renseignée
    var adresse = document.getElementById('adresseJS').value;
    var soins = document.getElementById('soinsJS').value;

    var url = "http://open.mapquestapi.com/geocoding/v1/address?key=ALN9kDZp1ArAFDdCApwmUmuXwy81ZXcY&location=" + adresse;
    $.getJSON(url, function (data) {
        longitude = (data.results[0].locations[0].latLng.lng).toString();
        latitude = (data.results[0].locations[0].latLng.lat).toString();
        
    });

    //appel du script 
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("display").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET","../scripts/search.php?lng="+longitude+"&lat="+latitude+"&soins="+soins,true);
    xmlhttp.send();


    


    

});


