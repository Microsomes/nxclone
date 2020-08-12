//helper class for helping with logic
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//all ticket types
class Ttype {
  static String singlejourney = "Single Journey";
  static String singlejourneycov = "Coventry Single Journey";
  static String daySaver = "Daysaver";
  static String daySavercov = "Coventry Daysaver";
  static String daysaversandwellanddudley = "Sandwell & Dudley Daysaver";
  static String daysaverwallsall = "Walsall Daysaver";
  static String daysaverafter930monfri = "Daysaver after 9.30am (Mon-Fri)";
  static String daySaversatsun = "Daysaver (Sat-Sun)";
  static String eveningSaverafter6 = "Evening Saver after 6pm";
  static String groupdaysaver = "Group Daysaver";
  static String groupdaysaverafter6 = "Group Daysaver after 6pm";
}

//all areas
class States {
  static String westMidlands = "West Midlands";
  static String conventry = "Coventry";
  static String blackCountry = "Black Country";
  static String sandwelldudleylowfarzone = "Sandwell & Dudley Low Fare Zone";
  static String wallsalllowfarzone = "Walsall Low Fare Zone";
  static String midlandmetra = "Midland Metro";
  static String outerbirmingham = "Outer Birmingham";
  static String warwickUni = "Warwick University";
}

class NXHelp {
  List ticketTypes;

  NXHelp() {
    //load and create table
    ticketTypes = List();
    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daySaver,
      "subtitle": "All busses across our network",
      "price": "4.60",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ////////conventry

    ticketTypes.add({
      "title": Ttype.singlejourneycov,
      "subtitle": "Any bus acorss our network",
      "price": "2.20",
      "state": States.conventry,
      "info": [
        "Includes travel on all our busses in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
        "The main places including in the Conventry area are:",
        "Conventry City Centre, Binley, Finham,",
        "Earlsdon, Canley, Longford, Bedworth,",
        "Meriden, Tile Hill, Hearsall Common,",
        "Leamington Spa & Kenilworth"
      ]
    });

    ticketTypes.add({
      "title": Ttype.daySavercov,
      "subtitle": "All busses in the Conventry area",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our busss in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
        "The main places including in the Conventry area are:",
        "Conventry City Centre, Binley, Finham,",
        "Earlsdon, Canley, Longford, Bedworth,",
        "Meriden, Tile Hill, Hearsall Common,",
        "Leamington Spa & Kenilworth"
      ]
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "Any busses across our network",
      "price": "3.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "Any busses across our network",
      "price": "6.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    //black country

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daySaver,
      "subtitle": "All busses across our network",
      "price": "4.60",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    //Sandwell & Dudley low fare zone

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daysaversandwellanddudley,
      "subtitle": "All busses in the Sandwell & Dudley zone",
      "price": "3.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses within the Sandwell & Dudley low fare zone."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    //wallsall low fare zone

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daysaverwallsall,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our busses within the Wallsall low fare zone"
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    //this.init();
  }

  void runInit(){
    this.init();
  }

  Future checkIfDisclaimerHasBeenAccepted() async {
    var hasAccepted = await this.loadConfig("disclaimer_accepted", 1);
    if (hasAccepted.length <= 0) {
      //no logs so it has not been accepted
      return false;
    }
    return true;
  }

  Future loadSpeedConfigs() async {
    var top = await this.loadConfig("movingtext_top", 1);
    var bottom = await this.loadConfig("movingtext_bottom", 1);

    if(top.length<=0){
      top= [{"val":"50"}];
      bottom= [{"val":"928"}];
    }else{

    }

    Map toReturn = Map();
    toReturn['top'] = top;
    toReturn['bottom'] = bottom;

    

    return toReturn;
  }

  //returns terms for single journey
  List<Text> termsForSingle() {
    return [
      Text("You must be over 16 to purchase this type of ticket",
          style: TextStyle(fontSize: 17)),
      Text(
          "Valid for a single journey on all National Express West Midlands and National Express Conventry busses.",
          style: TextStyle(fontSize: 17)),
      Text("Tickets must be used within 7 days of purchase.",
          style: TextStyle(fontSize: 17)),
      Text(
          "MTickets must be able to be displayed throughout the journey if requested by the driver or a member of staff",
          style: TextStyle(fontSize: 17)),
      Text(
          "Full mTicket terms and Conditions can be found at nxbus.co.uk/mticket and also subject to our Conditions of Carriage",
          style: TextStyle(fontSize: 17))
    ];
  }

  List<Text> termsForDaysaver() {
    return [
      Text("You must be over 16 to purchase this type of ticket",
          style: TextStyle(fontSize: 17)),
      Text("This ticket is valid on the day of the first activation only.",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      Text(
          "Valid on all National Express West Midlands and National Express Conventry busses.",
          style: TextStyle(fontSize: 17)),
      Text(
        "No refunds can be provided.",
        style: TextStyle(fontSize: 17),
      ),
      Text(
          "MTickets must be able to be displayed throughout the journey if requested by the driver or a member of staff",
          style: TextStyle(fontSize: 17)),
      Text(
          "Full mTicket terms and Conditions can be found at nxbus.co.uk/mticket and also subject to our Conditions of Carriage",
          style: TextStyle(fontSize: 17))
    ];
  }

  Future deleteAllTickets() async {
    var db = await openDatabase("main.db");
    await db.rawDelete("DELETE FROM ticketwallet");
  }

  void init() async {
    var db = await openDatabase("main.db");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS ticketwallet ( id integer  PRIMARY KEY AUTOINCREMENT, state text, tickettype text, tickettypeid text, expires text, isActive int, purchaseddate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,ticketid text)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS tickets ( id integer  PRIMARY KEY AUTOINCREMENT, state text NOT NULL, tickettitle text NOT NULL,ticketsubtitle text NOT NULL, price text NOT NULL)");

    //load default values

    print("run pre-runup setup");
    this.getAllTickets("West Midlands").then((value) {
      print(value.length);
    });
    print(ticketTypes.length);

    for (var element in ticketTypes) {
      //check duplicate first
      var dup =
          await this.checkTicketByState(element['title'], element['state']);
      if (dup.length == 0) {
        print("no dublicates");
        var id = await this.addTicket(element['title'], element['state'],
            element['price'], element['subtitle']);
        //saves to db
        var title = element['title'];
      } else {
        //print("duplicates");
      }
    }
  }

  //todo future run this function to clean up old expired tickets
  // Future cleanUpOldTickets() {
  //   //todo
  // }

  //if not null will buy and return an ticket id
  Future buyAndActivateDefaultTicket() async {
    var defaultTicket = await this.loadConfig("deficketv2", 1);
    if (defaultTicket.length == 0) {
      //no default selected we must use west-midlands as default and a daysaver

      var deftttype = Ttype.daySaver;
      var defstate = States.westMidlands;

      var ticketid = await this
          .buyTicket(tickettype: deftttype, state: defstate, price: "0.00");
      //provisions a ticket

      await this.activateTicket(id: ticketid);
      //activates a ticket

      return {"ticketid": ticketid, "state": defstate, "tickettype": deftttype};
    } else {
      var curDefault = defaultTicket[0]['val'].split(":");

      var ticketid = await this.buyTicket(
          tickettype: curDefault[1], state: curDefault[0], price: "0.00");
      //provisions a ticket

      await this.activateTicket(id: ticketid);
      //activates a ticket

      return {
        "ticketid": ticketid,
        "state": curDefault[0],
        "tickettype": curDefault[1]
      };
    }
  }

  Map returnTicketExpiryInfo(String ttype) {
    //ticket expires in that many hours
    if (ttype == Ttype.singlejourney || ttype == Ttype.singlejourneycov) {
      return {
        "expires": 10080,
        "activationExpiry": 30,
        "ticketType": ttype,
        "shouldbe": "single"
      };
    } else if (ttype == Ttype.daySaver ||
        ttype == Ttype.daySavercov ||
        ttype == Ttype.daySaversatsun ||
        ttype == Ttype.daysaversandwellanddudley ||
        ttype == Ttype.daysaverwallsall ||
        ttype == Ttype.daysaverafter930monfri) {
      return {
        "expires": 144000,
        "activationExpiry": 1440,
        "ticketType": ttype,
        "shouldbe": "daysaver"
      };
    } else {
      return {
        "expires": 144000,
        "activationExpiry": 1440,
        "ticketType": ttype,
        "shouldbe": "default"
      };
    }
  }

  Future getAllActiveTickets() async {
    var db = await openDatabase("main.db");
    List<Map> list = await db.rawQuery(
        "SELECT * FROM ticketwallet WHERE isActive=? ORDER BY id DESC", [1]);
    return list;
  }

  Future getAllAvailableToPurchaseTickets() async {
    var db = await openDatabase("main.db");
    List<Map> list = await db.rawQuery("SELECT * FROM tickets");
    return list;
  }

  //returns all tickets that can be useable
  Future getAllUseableTickets() async {
    var db = await openDatabase("main.db");

    List<Map> modifiedList = List<Map>();

    List<Map> list = await db.rawQuery(
        "SELECT * FROM ticketwallet WHERE isActive!=2  ORDER BY isActive DESC, expires DESC");

    list.forEach((curTicket) {
      Map toCur = Map();
      curTicket.forEach((key, value) {
        toCur[key] = value;
      });
      //when ticket is activated this is the expiry date
      if (curTicket['isActive'] == -1) {
        //calculate the preactivation expiiry
        var ticketPurchased = curTicket['expires'];
        //the date the ticket was purchased
        var ticketMeta = returnTicketExpiryInfo(curTicket['tickettype']);
        var expiriesIn = ticketMeta['expires'] / 24;
        expiriesIn = expiriesIn.toInt();
        var date = new DateTime.fromMicrosecondsSinceEpoch(
            int.parse(ticketPurchased) * 1000);
        var dateOfExpiry = date.add(Duration(minutes: expiriesIn));
        var newFormat = DateFormat("dd/MM/yyyy HH:MM");
        String updatedDt = newFormat.format(dateOfExpiry);
        toCur['ticketExpiry'] = updatedDt;
        //time before ticket expires when unactivated
      } else if (curTicket['isActive'] == 1) {
        var ticketPurchased = curTicket['expires'];
        var ticketMeta = returnTicketExpiryInfo(curTicket['tickettype']);
        var expiriesIn = ticketMeta['activationExpiry'];
        expiriesIn = expiriesIn.toInt();
        var date = new DateTime.fromMicrosecondsSinceEpoch(
            int.parse(ticketPurchased) * 1000);
        var dateOfExpiry = date.add(Duration(minutes: expiriesIn));
        var newFormat = DateFormat("dd/MM/yyyy HH:MM");
        String updatedDt = newFormat.format(dateOfExpiry);
        toCur['activationExpiry'] = updatedDt;
      }
      modifiedList.add(toCur);
    });

    return modifiedList;
  }

  //get ticket by id
  Future getTicketById({@required id}) async {
    var db = await openDatabase("main.db");
    List<Map> list =
        await db.rawQuery("SELECT * FROM ticketwallet WHERE id=?", [id]);
    return list;
  }

  //activates ticket by id
  //current time placed in expires to safe time
  Future activateTicket({@required id}) async {
    var db = await openDatabase("main.db");
    //lets grab the timestamp as well
    var currentTime = new DateTime.now().millisecondsSinceEpoch;
    var updateid = await db.rawQuery(
        "UPDATE ticketwallet SET isActive=?,expires=?  WHERE id=?",
        [1, currentTime, id]);
    return updateid;
  }

  //stores ticket in to db and generates a unique ID
  Future buyTicket(
      {@required tickettype, @required state, @required price}) async {
    var db = await openDatabase("main.db");
    var currentTime = new DateTime.now().millisecondsSinceEpoch;

    var id = await db.rawInsert(
        "INSERT INTO ticketwallet (state,tickettype,tickettypeid,expires,isActive,ticketid) VALUES (?,?,?,?,?,?)",
        [state, tickettype, "not used", currentTime, -1, 3235346459]);
    return id;
  }

  Future loadConfig(String key, int limit) async {
    var db = await openDatabase("main.db");
    List<Map> list = await db.rawQuery(
        'SELECT * FROM config WHERE key=? ORDER BY id DESC limit ?',
        [key, limit]);
    // db.close();
    return list;
  }

  Future saveConfig(String key, String val) async {
    var db = await openDatabase("main.db");
    var iid = await db
        .rawInsert("INSERT INTO config(key, val) VALUES(?, ?)", [key, val]);
    return iid;
  }

  Future getAllTickets(String state) async {
    var db = await openDatabase("main.db");
    List<Map> list =
        await db.rawQuery('SELECT * FROM tickets WHERE state=?', [state]);
    return list;
  }

  Future checkTicketByState(String type, String state) async {
    var db = await openDatabase("main.db");

    List<Map> list = await db.rawQuery(
        'SELECT * FROM tickets WHERE  state=? AND tickettitle=?',
        [state, type]);
    return list;
  }

  Future addTicket(
      String type, String state, String price, String subtitle) async {
    var db = await openDatabase("main.db");
    var iid = await db.rawInsert(
        "INSERT INTO tickets(tickettitle,state,price,ticketsubtitle) VALUES (?,?,?,?)",
        [type, state, price, subtitle]);
    return iid;
  }
}
