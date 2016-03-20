/* SqlLite ORM made using javascriprt (es2015)
  by Hamza ADAD
*/
import {Storage, SqlStorage, EventEmitter} from 'ionic-angular';

export class ORM {
  constructor(){
    this._tables = {
      config:{
        _create:"CREATE TABLE IF NOT EXISTS config(id INTERGER PRIMARY KEY, name TEXT, value TEXT)",
        _state:null
      }
    }
    this.storage = new Storage(SqlStorage);
    this.createTable("config").then((data)=>{
      console.log();
      if(data.res.rows.length != 0){
        this.inserInto({
          table:"config",
          data:{
            "name":"intro",
            "value":"true"
          }
        });
      }
    }, (err)=>{
      console.log(err);
    });

  }

  createTable(name){
    if(name in this._tables){
      return this.storage.query(this._tables[name]._create);
    }
    return new Promise();
  }
  inserInto(data){
    const fieldsArray = [];
    const valuesArray = [];
    Object.keys(data.data).map((elm)=>{
      fieldsArray.push(elm);
      valuesArray.push(data.data[elm]);
    })
    const query = "INSERT INTO "+data.table+" (id,\""+ fieldsArray.join('","') +"\") VALUES (1,\""+valuesArray.join('","') + "\")";
    this.storage
        .query(query)
        .then((data)=>{
          console.log(data);
        }, (err)=>{
          console.error(err);
        });
  }
  select(data, callback){
    if(data.table){
      this.storage.query("SELECT " + data.table + " FROM").then((data)=>{
        
      },(err)=>{
        if(callback){
          callback(true, err);
        }
      })
    }
  }


}
