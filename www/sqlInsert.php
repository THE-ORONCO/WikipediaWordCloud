<?php
if(isset($pageName)){
	$dubleCheck = "SELECT pageName FROM wikiartikel WHERE pageName = '".$pageName."'";
	$sqlQuery = "INSERT INTO `wikiartikel` (`pageName`, `pageID`, `pageViews`) VALUES ('".$conn->real_escape_string($pageName)."', '".$pageID."', '".$pageViews."')";

	if(is_null($conn->query($dubleCheck)->fetch_assoc())){
		if($conn->query($sqlQuery) === TRUE){
			echo ("Job done !");
		}else{
			echo ("There was an ERROR!");
		}
		foreach($ref AS $row){
			$sqlQuery = "INSERT INTO `reference` (`PK`, `pageName`, `pageID`, `linkTo_pageName`) VALUES (NULL, '".$conn->real_escape_string($pageName)."', '".$pageID."', '".$conn->real_escape_string($row->title)."')";
			if($conn->query($sqlQuery) === FALSE){
				echo ("OH NO \"".$row->title."\" create an ERROR!");
			}
		}
	}else{
		echo ("already in DB");
	}
}else{
	echo ("Nothing to import");
}

?>