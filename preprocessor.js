const ac = require('./apiCalls.js').default
//import aus apiCalls.js
// ./ verweis auf das verzeichnis in dem das ausgeführte script liegt

// wird getriggert und weist die anderen module an etwas zu tun
// fuer jede function in apiCall; apicall an crawler an Write
// Parrallel ? async? sequenziell? 
// mehrere instanzen von Crawler?


//name muss aufbereitet werden bevor dieser in die apiCalls gehen
// Bill Gates -> Bill_Gates
//Liste aller Präsidenten der USA -> Liste_aller_Präsidenten_der_USA
function enhanceTarget(target){
    // regex / /g, '+' -> / escape Zeichen welches das leerzeichen umschließt; g globale suche; ,'_' -> ersetzt durch _ 
    var dataName = target.replace(/ /g, '_');
    return dataName;
  }



function process(trigger){
  target = enhanceTargetName(trigger)
    

}
//bisher alle calls liefern url + cn
//getWikiDataID_URL gibt die Q nummer
//getViewsURL gibt die views
//getWhatLinksHereURL 
//getLinksTo