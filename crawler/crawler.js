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

//const ac = require("./apiCalls.js");
console.log(process.cwd)