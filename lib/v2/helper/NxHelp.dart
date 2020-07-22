//helper class for helping with logic
 import 'package:sqflite/sqflite.dart';
  import 'package:flutter/material.dart';


//all ticket types
class Ttype{
  static String singlejourney="Single Journey";
  static String singlejourney_cov="Coventry Single Journey";
  static String daySaver="Daysaver";
  static String daySaver_cov="Coventry Daysaver";
  static String daysaver_sandwellanddudley="Sandwell & Dudley Daysaver";
  static String daysaver_wallsall="Walsall Daysaver";
  static String daysaverafter930monfri="Daysaver after 9.30am (Mon-Fri)";
  static String daySaversatsun="Daysaver (Sat-Sun)";
  static String eveningSaverafter6="Evening Saver after 6pm";
  static String groupdaysaver="Group Daysaver";
  static String groupdaysaverafter6="Group Daysaver after 6pm";
}

//all areas
class States{
  static String westMidlands= "West Midlands";
  static String conventry= "Coventry";
  static String blackCountry="Black Country";
  static String sandwelldudleylowfarzone= "Sandwell & Dudley Low Fare Zone";
  static String wallsalllowfarzone= "Walsall Low Fare Zone";
  static String midlandmetra= "Midland Metro";
  static String outerbirmingham= "Outer Birmingham";
  static String warwickUni="Warwick University";
}

class NXHelp{


  List ticketTypes;

  NXHelp(){
    //load and create table
        ticketTypes=List();
      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":States.westMidlands,
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });


      ticketTypes.add({
        "title":Ttype.daySaver,
        "subtitle":"All busses across our network",
        "price":"4.60",
        "state":States.westMidlands,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.westMidlands,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.westMidlands,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"All busses across our network",
        "price":"3.00",
        "state":States.westMidlands,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":States.westMidlands,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":States.westMidlands,
        "info":[
             "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });



      ////////conventry
      
      ticketTypes.add({
        "title":Ttype.singlejourney_cov,
        "subtitle":"Any bus acorss our network",
        "price":"2.20",
        "state":States.conventry,
        "info":[
          "Includes travel on all our busses in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
          "The main places including in the Conventry area are:",
          "Conventry City Centre, Binley, Finham,",
          "Earlsdon, Canley, Longford, Bedworth,",
          "Meriden, Tile Hill, Hearsall Common,",
          "Leamington Spa & Kenilworth"
        ]
      });

      ticketTypes.add({
        "title":Ttype.daySaver_cov,
        "subtitle":"All busses in the Conventry area",
        "price":"4.00",
        "state":States.conventry,
        "info":[
          "Includes travel on all our busss in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
          "The main places including in the Conventry area are:",
          "Conventry City Centre, Binley, Finham,",
          "Earlsdon, Canley, Longford, Bedworth,",
          "Meriden, Tile Hill, Hearsall Common,",
          "Leamington Spa & Kenilworth"
        ]
      });

      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":States.conventry,
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":States.conventry,
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

       ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"Any busses across our network",
        "price":"3.00",
        "state":States.conventry,
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"Any busses across our network",
        "price":"6.00",
        "state":States.conventry,
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":States.conventry,
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      //black country

      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":States.blackCountry,
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

       ticketTypes.add({
        "title":Ttype.daySaver,
        "subtitle":"All busses across our network",
        "price":"4.60",
        "state":States.blackCountry,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.blackCountry,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.blackCountry,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"All busses across our network",
        "price":"3.00",
        "state":States.blackCountry,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":States.blackCountry,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":States.blackCountry,
        "info":[
             "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      //Sandwell & Dudley low fare zone

      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":States.sandwelldudleylowfarzone,
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.daysaver_sandwellanddudley,
        "subtitle":"All busses in the Sandwell & Dudley zone",
        "price":"3.00",
        "state":States.sandwelldudleylowfarzone,
        "info":[
            "Includes travel on all our buses within the Sandwell & Dudley low fare zone."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"6.00",
        "state":States.sandwelldudleylowfarzone,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.sandwelldudleylowfarzone,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });


      //wallsall low fare zone

      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":States.wallsalllowfarzone,
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

       ticketTypes.add({
        "title":Ttype.daysaver_wallsall,
        "subtitle":"All busses across our network",
        "price":"3.00",
        "state":States.wallsalllowfarzone,
        "info":[
            "Includes travel on all our busses within the Wallsall low fare zone"
        ]
      });
      
      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"6.00",
        "state":States.wallsalllowfarzone,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":States.wallsalllowfarzone,
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });



    this.init();




  }



  void init() async {
      var db= await openDatabase("main.db");
     await  db.execute("CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
     await db.execute("CREATE TABLE IF NOT EXISTS ticketwallet ( id integer  PRIMARY KEY AUTOINCREMENT, state text, tickettype text, tickettypeid text, expires text, isActive int, purchaseddate text,ticketid text)");
     await db.execute("CREATE TABLE IF NOT EXISTS tickets ( id integer  PRIMARY KEY AUTOINCREMENT, state text NOT NULL, tickettitle text NOT NULL,ticketsubtitle text NOT NULL, price text NOT NULL)");
      print("run pre-runup setup");


      this.getAllTickets().then((value){
        print(value.length);

      });


      print(ticketTypes.length);

  for(var element in ticketTypes) { 

    //check duplicate first
    var dup=await this.checkTicketByState(element['title'],element['state']);
    if(dup.length==0){
      print("no dublicates");
       var id= await this.addTicket(element['title'], element['state'], element['price'], element['subtitle']);
        //saves to db
        var title= element['title'];
     }else{
      //print("duplicates");
    }

    }

  }

 Future loadConfig(String key, int limit) async {
   var db= await openDatabase("main.db");
      List<Map> list = await db.rawQuery('SELECT * FROM config WHERE key=? ORDER BY id DESC limit ?',[key,limit]);
     // db.close();
      return list;
  }
  
  Future saveConfig(String key,String val) async {
      var db= await openDatabase("main.db");
      var iid= await db.rawInsert("INSERT INTO config(key, val) VALUES(?, ?)",[key,val]);
      return iid;
  }

  Future getAllTickets() async {
           var db= await openDatabase("main.db");
      List<Map> list = await db.rawQuery('SELECT * FROM tickets');
       return list;
  }


  Future checkTicketByState(String type,String state) async {
    
       var db= await openDatabase("main.db");

        List<Map> list = await db.rawQuery('SELECT * FROM tickets WHERE  state=? AND tickettitle=?',[state,type]);
       return list;
  }


  Future addTicket(String type, String state, String price, String subtitle) async {
    
      var db= await openDatabase("main.db");
     var iid= await db.rawInsert("INSERT INTO tickets(tickettitle,state,price,ticketsubtitle) VALUES (?,?,?,?)",[type,state,price,subtitle]);
      return iid;
  }


}