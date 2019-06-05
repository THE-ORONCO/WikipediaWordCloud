// request promise ueber shortcut aufrufbar
const rp = require("request-promise");
// cheerio ueber shortcut aufrufbar
const $ = require("cheerio");

// api abfrage für daten WhatLinksHere
// 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=Bill_Gates&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';
const urlPreTarge = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=';
const target = "Bill Gates"
const urlPosTarget = '&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';

//erwartete eingben vom User Bill Gates -> api call benoetigt Bill_Gates
//funktion ersetzt effizient ueber regex die leerzeichen mit underscore
function enhanceTarget(target){
  // regex / /g, '+' -> / escape Zeichen welches das leerzeichen umschließt; g globale suche; ,'_' -> ersetzt durch _ 
  var dataName = target.replace(/ /g, '_');
  return dataName;
}
//console.log(enhanceTarget(target));
crawler(enhanceTarget(target));

function crawler(dataName){
  const url = urlPreTarge + enhanceTarget(target) + urlPosTarget
  //console.log(url)
  rp(url)
  .then(function(html){
    //bei erfolg
    write2txt(html)
    //console.log("anzeige ist raus!");
  })
  .catch(function(html){
    // wenns schief geht
    //todo error handling
    console.log("error: http request failed");
  });

}

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

  function write2txt(data){
    const path = './tmpData/' + enhanceTarget(target) + '.json';
    //console.log(path)

      const fs = require("fs");
      fs.writeFile(path, data, function(err){
          if(err){
              return console.log(err);
          }
          console.log("Speichern erfolgreich!");
      })
  }