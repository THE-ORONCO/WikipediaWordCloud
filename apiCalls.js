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
function getLinksTo(){
  //https://en.wikipedia.org/w/api.php?action=query&titles=Bill_Gates&prop=links&pllimit=max
  const url = 'https://en.wikipedia.org/w/api.php?action=query&titles='+ enhanceTarget(target) + '&prop=links&pllimit=max'
  const cn = "_lt"
  return [url, cn]
}