<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
	$redirectID = htmlspecialchars($_GET["id"]);

	if ($redirectID != null) {
		require_once("lib/config.php");

		$sql = "SELECT * FROM UrlList WHERE id='".$redirectID."'";

		$result = $mysqli->query($sql);

		//Check if id exist in UrlList
		if($result->num_rows > 0) {

			$row = $result->fetch_assoc();

			//Store redirect URL
			$redirectURL = $row["redirectURL"];

			//Insert activity to UrlActivity table
			$userIP = getUserIpAddr();
			$userAgent = $_SERVER['HTTP_USER_AGENT'];
			$hostedLocationID = $row["hostedLocationID"];
			$projectID =  $row["urlProjectID"];

			// Use JSON encoded string and converts
			// it into a PHP variable
			$ipdat = @json_decode(file_get_contents(
				"http://www.geoplugin.net/json.gp?ip=" . getUserIpAddr()));
			
			$country = $ipdat->geoplugin_countryName;
			$region = $ipdat->geoplugin_regionName;
			$city = $ipdat->geoplugin_city;
			$continent = $ipdat->geoplugin_continentName;
			$lat = $ipdat->geoplugin_latitude;
			$long = $ipdat->geoplugin_longitude;
			$timezone = $ipdat->geoplugin_timezone;
		
			//Insert in UrlActivity Table
			$sql = "INSERT INTO UrlActivity (ip, country, city, region, continent, latitude, longitude, timezone, useragent, urlLocationID, projectID) 
				VALUES ('".$userIP."', '".$country."', '".$city."', '".$region."','".$continent."', '".$lat."', '".$long."', '".$timezone."', '".$userAgent."', '".$hostedLocationID."', '".$projectID."')"; 

			$mysqli->query($sql);

			header('Location: '.$redirectURL.'');
		} else {
			header('Location: index');
		}
	} else {
		header('Location: index');
	}

	function getUserIpAddr(){
		return $_SERVER['HTTP_CLIENT_IP'] 
		?? $_SERVER["HTTP_CF_CONNECTING_IP"] # when behind cloudflare
		?? $_SERVER['HTTP_X_FORWARDED'] 
		?? $_SERVER['HTTP_X_FORWARDED_FOR'] 
		?? $_SERVER['HTTP_FORWARDED'] 
		?? $_SERVER['HTTP_FORWARDED_FOR'] 
		?? $_SERVER['REMOTE_ADDR'] 
		?? '0.0.0.0';
	}

?>
