<?php
$jsonLT = "";
$jsonPV = "";
$jsonWLH = "";
$handle=opendir (".");
while($datei = readdir($handle)){
	if(endsWith($datei, "_lt.json")){
		$jsonLT = $datei;
	}
	if(endsWith($datei, "_pv.json")){
		$jsonPV = $datei;
	}
	if(endsWith($datei, "_wlh.json")){
		$jsonWLH = $datei;
	}
}
closedir($handle);
function endsWith($file, $end){
	$lenght = strlen($end);
	if($lenght == 0)
		return true;
	
	return (substr($file, -$lenght) === $end);
}

if(file_exists($jsonLT)){
	$pageID = "";
	$pageName = "";
	
	$json = file_get_contents($jsonLT);
	$jsonArray = json_decode($json);
	$pageID = (explode("|", $jsonArray->continue->plcontinue)[0]);
	$pageName = $jsonArray->query->pages->$pageID->title;
	$ref = $jsonArray->query->pages->$pageID->links;
	//unlink($jsonLT);
}
if(file_exists($jsonPV)){
	$pageViews = 0;
	$json = file_get_contents($jsonPV);
	$jsonArray = (json_decode($json))->items;
	for($i=0; $i < count($jsonArray); $i++){
		$pageViews += ($jsonArray[$i]->views);
	}
	//unlink($jsonPV);
}
?>