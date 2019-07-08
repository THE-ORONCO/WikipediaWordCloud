<?php
$searchName = isset($_GET['name']) ? $_GET['name'] : "";

$sql = "SELECT * FROM `wikiartikel` as w JOIN reference as r ON w.pageName = r.pageName WHERE w.pageName LIKE '%".$searchName."%' LIMIT 500";
$res = $conn->query($sql)->fetch_all();

if(!empty($res) AND $searchName != ""){
	$xml = new XMLWriter();

	$xml->openURI($pageName.".xml");
	$xml->startDocument();
	$xml->setIndent(true);

	$xml->startElement('wiki');
		$xml->startElement('pageName');
			$xml->writeRaw(htmlspecialchars($res[0][1], ENT_XML1));
		$xml->endElement();
		$xml->startElement('pageID');
			$xml->writeRaw($res[0][2]);
		$xml->endElement();
		$xml->startElement('pageViews');
			$xml->writeRaw($res[0][3]);
		$xml->endElement();
		$xml->startElement('linkTos');
    		for($i=0; $i < count($res); $i++){
    		$xml->startElement('linkTo');
    		    $xml->startElement('target');
    			    $xml->writeRaw(htmlspecialchars($res[$i][7], ENT_XML1));
    			$xml->endElement();
    		$xml->endElement();
    		}
        $xml->endElement();
	$xml->endElement();

	$xmlOutput = $xml->flush();
}elseif(empty($res)){
	echo("Not found in DB");
}elseif($searchName == ""){
	echo("Enter something");
}
?>