//writer wird core daten im ersten Parameter befeuert
// stringParam enthaelt apiCall spezifischen tag fuer den Namen

//enhance name ist ausgelagert
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

  //todo nach tests console.log entfernen