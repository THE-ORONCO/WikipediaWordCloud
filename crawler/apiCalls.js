module.exports = {
 // liefert den api call for einen request
// WikimediaID aufrufbar ueber query.'pageid'.pageprops.wikibase_item -> Q5284 (Wikidata zu Bill Gates)
getWikiDataID_URL = function(target){
  //api call https://en.wikipedia.org/w/api.php?action=query&prop=pageprops&ppprop=wikibase_item&redirects=1&titles=Bill_Gates&format=json
  const url = 'https://en.wikipedia.org/w/api.php?action=query&prop=pageprops&ppprop=wikibase_item&redirects=1&titles=' + target + '&format=json'
  //_wdid = tag im dateinamen fuer WikiDataID
  const cn = "_wdid"
  return [url, cn];
},

//It only includes data back to July 1, 2015
//call für die views Anfang und ende in yyyymmdd
// sprache des wiki artikels ueber cc.wikipedia
// welcher viewtype all-access/all-agents (unabhaengig von zugriff )
//https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/Bill_Gates/daily/20151010/20181012
getViewsURL = function(target){
const url = 'https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/'+ target +'/monthly/20150601/' + today();
// crawler ansteuern 
// writer ansteuern mit custom name
//_pv = tag im dateinamen fuer pageviews 
const cn = "_pv"
return [url, cn];
},

getWhatLinksHereURL = function(target){
// api abfrage für daten WhatLinksHere
// _wlh = tag im namen _wlh fuer WhaLinksHere
// 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=Bill_Gates&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';
const urlPreTarge = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=linkshere&titles=';
const urlPosTarget = '&converttitles=1&utf8=1&lhprop=title|pageid&lhnamespace=0&lhlimit=500';
const url = urlPreTarge + target + urlPreTarge
  // _wlh = tag im namen fuer WhaLinksHere
const cn = "_wlh"
return [url,  cn];
},
getLinksTo = function (target){
//https://en.wikipedia.org/w/api.php?action=query&titles=Bill_Gates&prop=links&pllimit=max
//https://en.wikipedia.org/w/api.php?action=query&titles=Bill_Gates&prop=links&pllimit=max&format=json
// _lt = tag im namen für LinksTo
const url = 'https://en.wikipedia.org/w/api.php?action=query&titles='+ target +'&prop=links&pllimit=max&format=json'
const cn = "_lt"
return [url, cn]
} 

}

function today() {
  function twoDigit(n) { return (n < 10 ? '0' : '') + n; }

  var now = new Date();
  return '' + now.getFullYear() + twoDigit(now.getMonth() + 1) + twoDigit(now.getDate());
}