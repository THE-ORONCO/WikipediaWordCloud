// request promise ueber shortcut aufrufbar
const rp = require("request-promise");
// cheerio ueber shortcut aufrufbar
const $ = require("cheerio");
// target wird von usereingabe gesetzt + trigger fuer crawler 
const target = "Bill Gates"

//erwartete eingben vom User Bill Gates -> api call benoetigt Bill_Gates
//funktion ersetzt effizient ueber regex die leerzeichen mit underscore
function enhanceTarget(target){
  // regex / /g, '+' -> / escape Zeichen welches das leerzeichen umschließt; g globale suche; ,'_' -> ersetzt durch _ 
  var dataName = target.replace(/ /g, '_');
  return dataName;
}

// default crawler ohne filter und ohne custom UserAgent
function crawler(url){
  //const url = urlPreTarge + enhanceTarget(target) + urlPosTarget
  //console.log(url)
  rp(url)
  .then(function(html){
    //bei erfolg
    //todo write aufruf entfernen -> return html an function
    return html;
    //console.log("anzeige ist raus!");
  })
  .catch(function(html){
    // wenns schief geht
    //todo error handling
    console.log("error: http request failed");
  });
}

//todo crawler() mit UserAgent + Crawler filter mit Cheerio

/* rp(api)
  .then(function(html){
    //success!
    //console.log($('big > a', html).length);
    //console.log($('big > a', html));
    //console.log(html);
    write2txt(html);
  })
  .catch(function(err){
    //handle error
  }); */

  function write2json(data, stringParam){
    const customName = stringParam;
    const path = './tmpData/' + enhanceTarget(target)+customName + '.json';
    //console.log(path)
    //todo custom name from function support hinzufuegen
      const fs = require("fs");
      fs.writeFile(path, data, function(err){
          if(err){
              return console.log(err);
          }
          console.log("Speichern erfolgreich!");
      })
  }
// liefert den api call for einen request
// WikimediaID aufrufbar ueber query.'pageid'.pageprops.wikibase_item -> Q5284 (Wikidata zu Bill Gates)
  function getWikiDataID_URL(){
    //api call https://en.wikipedia.org/w/api.php?action=query&prop=pageprops&ppprop=wikibase_item&redirects=1&titles=Bill_Gates&format=json
    const url = 'https://en.wikipedia.org/w/api.php?action=query&prop=pageprops&ppprop=wikibase_item&redirects=1&titles=' + enhanceTarget(target) + '&format=json'
    //_wdid = tag im dateinamen fuer WikiDataID
    const cn = "_wdid"
    return [url, cn];
  }

//call für die views Anfang und ende in year month day
// sprache des wiki artikels ueber cc.wikipedia
// welcher viewtype all-access/all-agents (unabhaengig von zugriff )
//https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/Bill_Gates/daily/20151010/20181012
function getViewsURL(){
  const url = 'https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/'+ enhanceTarget(target)+'/daily/20151010/20181012'
  // crawler ansteuern 
  // writer ansteuern mit custom name
  //_pv = tag im dateinamen fuer pageviews 
  const cn = "_pv"
  return [url, cn];
}

function getWhatLinksHereURL(){
  // api abfrage für daten WhatLinksHere
// 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=Bill_Gates&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';
const urlPreTarge = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=';
const urlPosTarget = '&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';
const url = urlPreTarge + enhanceTarget(target) + urlPreTarge
// tag im namen _wlh -> WhaLinksHere
const cn = "_wlh"
return [url,  cn];
}

// wird mit nem get...URL befeuert
// prozessiert: Normalisierung des targets Bill Gates -> Bill_Gates
// request and api request url aus functionCall (get...URL)
// schreibt json datei mit cn 0 customName -> tag der die Inhalt erkennbar macht
// beispielhafter aufruf procress(getViewsURL())
function process(functionCall){
  var url,cn = functionCall
  write2json(crawler(url), cn)
  }
 
// beispiel fuer data handling bei mehreren return werten
/* function debugTest(){
  var x,y = getWhatLinksHereURL();
  console.log(y)
} */
//debugTest();

/* test(getWikiDataID_URL())
function test(functionCall){
  var url = functionCall[0]
  var cn = functionCall[1]
  console.log(url)
} */