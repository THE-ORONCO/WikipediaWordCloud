<?php
$searchName = isset($_GET['name']) ? $_GET['name'] : "";

$sql = "SELECT * FROM `wikiartikel` as w JOIN reference as r ON w.pageName = r.pageName WHERE w.pageName LIKE '%".$searchName."%' LIMIT 500";
$res = $conn->query($sql)->fetch_all();

if(!empty($res) AND $searchName != ""){
	$xml = new XMLWriter();

	$xml->openURI($res[0][0].".xml");
	$xml->startDocument();
	$xml->setIndent(true);

	$xml->startElement('wiki');
		$xml->startElement('pageName');
			$xml->writeRaw(htmlspecialchars($res[0][0], ENT_XML1));
		$xml->endElement();
		$xml->startElement('pageID');
			$xml->writeRaw($res[0][1]);
		$xml->endElement();
		$xml->startElement('pageViews');
			$xml->writeRaw($res[0][2]);
		$xml->endElement();
		$xml->startElement('linkTos');
    		for($i=0; $i < count($res); $i++){
    		$xml->startElement('linkTo');
    		    $xml->startElement('target');
    			    $xml->writeRaw(htmlspecialchars($res[$i][6], ENT_XML1));
    			$xml->endElement();
    		$xml->endElement();
    		}
        $xml->endElement();
	$xml->endElement();

	$xmlOutput = $xml->flush();
	
	$xml = new DOMDocument;
	$xml->load($pageName.".xml");

	$xsl = new DOMDocument;
	$xsl->load('xmlToJson.xslt');

	$proc = new XSLTProcessor;
	$proc->importStyleSheet($xsl);

	$myfile = fopen($pageName.".json", "w") or die("Unable to open file!");
	fwrite($myfile, $proc->transformToXML($xml));
	fclose($myfile);
	
}elseif(empty($res)){
	echo("Not found in DB");
}elseif($searchName == ""){
	echo("Enter something");
}

?>