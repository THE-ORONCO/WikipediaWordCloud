<?php

$xml = new DOMDocument;
$xml->load('../Bill Gates.xml');

$xsl = new DOMDocument;
$xsl->load('xmlToJson.xslt');

$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);

?>