
<?php 
class UserData extends PDO {


	// Konstruktormethode: Stelle die Verbindung zur DB her
    public function __construct($host, $user, $dbname, $passwd) {
			// utf am besten immer mitsenden, damit es keine Probleme gibt
			// dsn "schlüssel" für die Datenbankverbindung
    	$dsn = 'mysql:host=' . $host . ';dbname=' . $dbname .';charset=utf8'; // empfehlenswert, charset auch anzugeben als Sicherheit
    	
        // Array für Optionen für PDO anlegen
        $options = array(
        	// Wir wollen in der Testphase wissen, ob es Fehler gibt.
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            // Mit dieser Option werden die Resultate in Form von assoziativen Arrays retour kommen.
            // In den meisten Fällen ist das der effizienteste Weg, die Resultate in HTML auszugeben ...
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        );
        try {
        	// Konstruktor der PDO-Klasse (Superklasse) aufrufen, das muss man machen weil er aus der SUPERKLASSE kommt
			parent::__construct($dsn, $user, $passwd, $options);
		}
		catch (PDOException $e) {
			// es wird auf eine Methode zugegriffen um die Fehlermeldungen abzurufen und auszugeben (im Live Betrieb ausschalten!!)
			die("Verbindung zur Datenbank fehlgeschlagen: ".$e->getMessage());
		}
	}


  

  // READ METHOD
  public function readMethod($userid) {

		$query = "SELECT post_text FROM blogpost WHERE post_author = $userid";
		$stmt = $this -> prepare($query);
		$stmt -> execute();
		$result = $stmt -> fetchAll(); // mehrere Datensätze
		return $result;

    echo '<pre>';
    print_r($result);
    echo '</pre>';
	}





}




?>