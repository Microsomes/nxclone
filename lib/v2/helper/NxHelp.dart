//helper class for helping with logic
 import 'package:sqflite/sqflite.dart';
  import 'package:flutter/material.dart';
class NXHelp{

  NXHelp(){
    //load and create table
    this.init();

  }

  void init() async {
      var db= await openDatabase("main.db");
      db.execute("CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
      print("run pre-runup setup");
      db.close();
  }

 Future loadConfig(String key, int limit) async {
   var db= await openDatabase("main.db");
      List<Map> list = await db.rawQuery('SELECT * FROM config WHERE key=? ORDER BY id DESC limit ?',[key,limit]);
      db.close();
      return list;
  }
  
  Future saveConfig(String key,String val) async {
      var db= await openDatabase("main.db");
      var iid= await db.rawInsert("INSERT INTO config(key, val) VALUES(?, ?)",[key,val]);
      return iid;
  }



}