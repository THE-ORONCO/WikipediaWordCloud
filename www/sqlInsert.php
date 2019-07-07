<?php
	
$dubleCheck = "SELECT pageName FROM wikiartikel WHERE pageName = '".$pageName."'";
$sqlQuery = "INSERT INTO `wikiartikel` (`PK`, `pageName`, `pageID`, `pageViews`) VALUES (NULL, '".$pageName."', '".$pageID."', '".$pageViews."')";

if(is_null($conn->query($dubleCheck)->fetch_assoc())){
	if($conn->query($sqlQuery) === TRUE){
		echo ("Job done !");
	}else{
		echo ("There was an ERROR!");
	}
	foreach($ref AS $row){
		$sqlQuery = "INSERT INTO `reference` (`PK`, `pageName`, `pageID`, `linkTo_pageName`) VALUES (NULL, '".$pageName."', '".$pageID."', '".$row->title."')";
		if($conn->query($sqlQuery) === FALSE){
			echo ("OH NO there was an ERROR!");
		}
	}
}else{
	echo ("already in DB");
}

?>