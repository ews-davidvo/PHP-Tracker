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
			
			echo 'User IP is '.getUserIpAddr();
			echo $_SERVER['HTTP_USER_AGENT'];
			echo "<br/> id: " . $row["id"] . " redirectURL: " . $row["redirectURL"] . "hostedLocationID: " . $row["hostedLocationID"];

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
			
			// echo 'Country Name: ' . $ipdat->geoplugin_countryName . "\n";
			// echo 'City Name: ' . $ipdat->geoplugin_city . "\n";
			// echo 'Continent Name: ' . $ipdat->geoplugin_continentName . "\n";
			// echo 'Latitude: ' . $ipdat->geoplugin_latitude . "\n";
			// echo 'Longitude: ' . $ipdat->geoplugin_longitude . "\n";
			// echo 'Currency Symbol: ' . $ipdat->geoplugin_currencySymbol . "\n";
			// echo 'Currency Code: ' . $ipdat->geoplugin_currencyCode . "\n";
			// echo 'Timezone: ' . $ipdat->geoplugin_timezone;

			$sql = "INSERT INTO UrlActivity (ip, country, city, region, continent, latitude, longitude, timezone, useragent, urlLocationID) 
				VALUES ('".$userIP."', '".$country."', '".$city."', '".$region."','".$continent."', '".$lat."', '".$long."', '".$timezone."', '".$userAgent."', '".$hostedLocationID."')"; 

			$mysqli->query($sql);
			// header('Location: '.$row["redirectURL"].'');
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
