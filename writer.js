//writer wird core daten im ersten Parameter befeuert
// stringParam enthaelt apiCall spezifischen tag fuer den Namen

//enhance name ist ausgelagert


  module.exports = {
     write2json = function(data, cn, articelName){
        const path = './../toRef/' + articelName+cn + '.json';
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
  }