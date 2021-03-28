//helper class for helping with logic
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

//all ticket types
class Ttype {
  //All the standard bus tickets
  static String singlejourney = "Single Journey";

  static String singleJourney10 = "Single Journey (10 Pack)";

  static String singlejourneycov = "Coventry Single Journey";
  static String daySaver = "Daysaver";
  static String daySavercov = "Coventry Daysaver";
  static String daysaversandwellanddudley = "Sandwell & Dudley Daysaver";
  static String daysaverwallsall = "Walsall Daysaver";
  static String daysaverafter930monfri = "Daysaver after 9.30am (Mon-Fri)";
  static String daysaverafter930monfri10 =
      "Daysaver after 9.30am (10 Pack) (Mon-Fri)";
  static String daySaversatsun = "Daysaver (Sat-Sun)";
  static String eveningSaverafter6 = "Evening Saver after 6pm";
  static String groupdaysaver = "Group Daysaver";
  static String groupdaysaverafter6 = "Group Daysaver after 6pm";

  //all the metro tickets
  static String adult1weekMetro = "Adult 1 Week Metro Only";
  static String adult4weekMetro = "Adult 4 Week Metro Only";
  static String adult1weekMetroBus = "Adult 1 Week Metro & Bus";
  static String adulst4weekMetroBus = "Adult 4 Week Metro & Bus";
  static String student4WeekMetro = "Student 4 Week";

  //warwick university
  static String universitySingleHop = "University Single Hop";
  static String universitySingleHop10 = "University Single Hop (10 Pack)";
  static String lemingtonSpaHop = "Leamington Spa Hop";
  static String lemintonSpaHop10 = "Leamington Spa Hop (10 Pack)";
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

  static String DB_NAME = "main11.db";

  NXHelp() {
    //load and create table
    ticketTypes = List();

    /**
     * All outer Birmingham Tickets
     */
    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses in the Outer Birmingham zone",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the Local Daysaver low fare zone"
      ]
    });

    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses in the Outer Birmingham zone",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the Local Daysaver low fare zone"
      ]
    });

    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.singleJourney10,
      "subtitle": "Any busses across our network",
      "price": "23.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri10,
      "subtitle": "Any busses in the Outer Birmingham zone",
      "price": "30.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses within the Local Daysaver low fare zone"
      ]
    });



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
      "price": "4.00",
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

    /**
     * Importing all the metro tickets
     */

    ticketTypes.add({
      "title": Ttype.adult1weekMetro,
      "subtitle": "On Metro tram",
      "price": "23.00",
      "state": States.midlandmetra,
      "info": ["Includes travel on all the Midland Metro Trapm route."]
    });

    ticketTypes.add({
      "title": Ttype.adult4weekMetro,
      "subtitle": "On Metro tram",
      "price": "81.00",
      "state": States.midlandmetra,
      "info": ["Includes travel on all the Midland Metro Trapm route."]
    });

    ticketTypes.add({
      "title": Ttype.adult1weekMetroBus,
      "subtitle": "On Metro & all buses across our network",
      "price": "25.90",
      "state": States.midlandmetra,
      "info": [
        "Includes travel on all the Midland Metro Trapm route and all our busses across the West Midlands, Black Country & Conventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.adulst4weekMetroBus,
      "subtitle": "On Metro & all buses across our network",
      "price": "90.85",
      "state": States.midlandmetra,
      "info": [
        "Includes travel on all the Midland Metro Trapm route and all our busses across the West Midlands, Black Country & Conventry."
      ]
    });

    ticketTypes.add({
      "title": Ttype.student4WeekMetro,
      "subtitle": "On Metro & all buses across our network",
      "price": "63.00",
      "state": States.midlandmetra,
      "info": ["Include travel on all the Midland Metro Tram route."]
    });

    //warwickUni
    ticketTypes.add({
      "title": Ttype.universitySingleHop,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "1.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Uni Hop short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ]
    });
    ticketTypes.add({
      "title": Ttype.universitySingleHop10,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "10.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Uni Hop short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ]
    });
    ticketTypes.add({
      "title": Ttype.lemingtonSpaHop,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "1.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Lemington Spa short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ]
    });
    ticketTypes.add({
      "title": Ttype.lemintonSpaHop10,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "10.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Lemington Spa short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ]
    });

    //this.init();
  }

  Future runInit() async {
    await Future.delayed(Duration(seconds: 10));
    this.init().then((value) {
      print("import completed");
    });
  }

  Future runScan() async {
    var allTick = await this.getAllUseableTickets();
    return allTick;
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

    if (top.length <= 0) {
      top = [
        {"val": "50"}
      ];
      bottom = [
        {"val": "928"}
      ];
    } else {}

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
    var db = await openDatabase(NXHelp.DB_NAME);
    await db.rawDelete("DELETE FROM ticketwallet");
  }

  Future init() async {
    var db = await openDatabase(NXHelp.DB_NAME);
    await db.execute(
        "CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS ticketwallet ( id integer  PRIMARY KEY AUTOINCREMENT, state text, tickettype text, tickettypeid text, expires text, isActive int, purchaseddate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,ticketid text)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS tickets ( id integer  PRIMARY KEY AUTOINCREMENT, state text NOT NULL, tickettitle text NOT NULL,ticketsubtitle text NOT NULL, price text NOT NULL, info text NOT NULL)");

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
        //DO NOT COMMENT THIS CODE OITU ITS VERY IMPORTANT
        var id = await this.addTicket(element['title'], element['state'],
            element['price'], element['subtitle'], element["info"][0]);

        Future.delayed(Duration(seconds: 1));
        //saves to db
        //var title = element['title'];
      } else {
        print("duplicates");
      }
    }
    return "imported";
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
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list = await db.rawQuery(
        "SELECT * FROM ticketwallet WHERE isActive=? ORDER BY id DESC", [1]);
    return list;
  }

  Future getAllAvailableToPurchaseTickets() async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list = await db.rawQuery("SELECT * FROM tickets");
    return list;
  }

  //returns ticket by id
  Future getInfoOnTicketById(int id) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var details =
        await db.rawQuery("SELECT * FROM ticketwallet WHERE id=?", [id]);
    return details;
  }

  //method will cause expiry to the ticket
  Future expireTicket(int id) async {
    print("expires ticket");
    var db = await openDatabase(NXHelp.DB_NAME);
    var status = await db
        .rawUpdate("UPDATE ticketwallet SET isActive=? WHERE id=?", [2, id]);
    print(status);
    return status;
  }

  //returns all historical tickets
  Future getAllHistoricalTickets() async {
    var db = await openDatabase(NXHelp.DB_NAME);

    List<Map> modifiedList = List<Map>();

    List<Map> list = await db.rawQuery(
        "SELECT * FROM ticketwallet WHERE isActive=2  ORDER BY isActive DESC, expires DESC");

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

  //returns all tickets that can be useable
  Future getAllUseableTickets() async {
    var db = await openDatabase(NXHelp.DB_NAME);

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
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list =
        await db.rawQuery("SELECT * FROM ticketwallet WHERE id=?", [id]);
    if (list.length >= 1) {
      //lets try and grab the price too;
      var state = list[0]["state"];
      var tickettype = list[0]["tickettype"];
      print(state);
      print(tickettype);
      var allTickets = await db
          .rawQuery("SELECT * FROM tickets WHERE tickettitle=?", [tickettype]);
      Map<String, dynamic> toreturn = new Map<String, dynamic>();
      toreturn["list"] = list;
      if (allTickets.length >= 1) {
        toreturn["price"] = allTickets[0]["price"];
        toreturn["subtitle"] = allTickets[0]["ticketsubtitle"];
      }
      return toreturn;
    }
  }

  //activates ticket by id
  //current time placed in expires to safe time
  Future activateTicket({@required id}) async {
    var db = await openDatabase(NXHelp.DB_NAME);
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
    var db = await openDatabase(NXHelp.DB_NAME);
    var currentTime = new DateTime.now().millisecondsSinceEpoch;

    var id = await db.rawInsert(
        "INSERT INTO ticketwallet (state,tickettype,tickettypeid,expires,isActive,ticketid) VALUES (?,?,?,?,?,?)",
        [state, tickettype, "not used", currentTime, -1, 3235346459]);
    return id;
  }

  Future loadConfig(String key, int limit) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list = await db.rawQuery(
        'SELECT * FROM config WHERE key=? ORDER BY id DESC limit ?',
        [key, limit]);
    // db.close();
    return list;
  }

  Future saveConfig(String key, String val) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var iid = await db
        .rawInsert("INSERT INTO config(key, val) VALUES(?, ?)", [key, val]);
    return iid;
  }

  Future getAllTickets(String state) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list =
        await db.rawQuery('SELECT * FROM tickets WHERE state=?', [state]);
    return list;
  }

  Future checkTicketByState(String type, String state) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list = await db.rawQuery(
        'SELECT * FROM tickets WHERE  state=? AND tickettitle=?',
        [state, type]);
    return list;
  }

  Future addTicket(String type, String state, String price, String subtitle,
      String info) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var iid = await db.rawInsert(
        "INSERT INTO tickets(tickettitle,state,price,ticketsubtitle,info) VALUES (?,?,?,?,?)",
        [type, state, price, subtitle, info]);
    return iid;
  }
}
