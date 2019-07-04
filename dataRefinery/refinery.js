
const fs = require('fs');
//path to our data

const toRef = './../toRef/';
const toDB = './../toDB/';

const target = "Bill_Gates_pv.json"
const file = toRef + target


//function openPageView(){
    //const data = JSON.parse(fs.readFileSync('./../toRef/Bill_Gates_pv.json'))
// baum aufbau
//items:x:views:53435

/* for( xkeys in data.items){
 //console.log(xkeys)
  var temp = data.items.xkeys.map(elem=>{
      const obj = Object.assign({
        views = :elem.views
      })
      return obj
  });
}} */

var callback = console.log;

function traverseViews(obj) {
  var myPV = [];
    if (obj instanceof Array) {
        for (var i=0; i<obj.length; i++) {
            if (typeof obj[i] == "object" && obj[i]) {
              //console.log("erste if /n");
              // gibt die oberen objekte (items -> 46)
                //callback(i);
                traverseViews(obj[i]);
            } else {
                //callback(i, obj[i])
            }
        }
    } else {
        for (var prop in obj) {
            if (typeof obj[prop] == "object" && obj[prop]) {
                //callback(prop);
                traverseViews(obj[prop]);
            } else {
                //console.log("erste else")
               // callback(prop, obj[prop]);
               //filter nach views und gibt nur die values zurück
                if (prop == "views"){
                  //callback(obj[prop]);
                  myPV.push(obj[prop])
                }
            }
        }
    }
    console.log(myPV)
}
//traverseViews( JSON.parse(fs.readFileSync('./../toRef/Bill_Gates_pv.json')) );
 
//fileFinder();

//sucht und findet saemtliche dateien in toRef/
function fileFinder(){
  fs.readdir("./../toRef/", function (err, files) {
    if (err) {
      console.log(err);
      return;
    }
    //console.log(files);
    //return files
  });
}


function xmlWriterPV(type, xmlData){
var builder = require('xmlbuilder');
var xml = builder.create('root')
  .ele('data')
    .ele(type)
    .txt(xmlData)
  .end({ pretty: true});

console.log(xml);
}

