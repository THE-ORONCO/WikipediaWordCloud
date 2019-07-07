<?php
// alle Dateien in einem Verzeichnis auslesen

$handle=opendir (".");
$xmlFile = "";

while ($datei = readdir ($handle)) {
	if(endsWith($datei, ".xml"))
		$xmlFile = $datei;
}
function endsWith($haystack, $needle){
    $length = strlen($needle);
    if ($length == 0) {
        return true;
    }

    return (substr($haystack, -$length) === $needle);
}
closedir($handle);

if(file_exists($xmlFile))
	$xml = simplexml_load_file($xmlFile);

echo $xml->interpret[0]->name;

?>