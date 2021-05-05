//helper class for helping with logic
import 'package:BubbleGum/v2/models/defaultHomePageModel.dart';
import 'package:BubbleGum/v2/models/ejectionSettingModel.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class SimType {
  static String single = "Singles";
  static String day = "Day";
  static String evening = "Evening";
  static String group = "Group";
  static String test = "Test";
  static String metro = "Metro";
  static String uni = "UNI";
}

class SharedPrefKeys {
  static String setupKey = "is_new_setup1";
}

class NXHelp {
  List ticketTypes;

  static String DB_NAME = "main13.db";

  NXHelp() {
    //load and create table
    ticketTypes = List();

    /**
     * Create EDU Fake Ticket
     */
    ticketTypes.add({
      "title": "Grove Pass",
      "subtitle": "All busses Across the Grove Arthur Cartel Network",
      "price": "100.00",
      "state": "POOBIC",
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.test
    });

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
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses in the Outer Birmingham zone",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the Local Daysaver low fare zone"
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses in the Outer Birmingham zone",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the Local Daysaver low fare zone"
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    ticketTypes.add({
      "title": Ttype.singleJourney10,
      "subtitle": "Any busses across our network",
      "price": "23.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri10,
      "subtitle": "Any busses in the Outer Birmingham zone",
      "price": "30.00",
      "state": States.outerbirmingham,
      "info": [
        "Includes travel on all our buses within the Local Daysaver low fare zone"
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daySaver,
      "subtitle": "All busses across our network",
      "price": "4.60",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.westMidlands,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
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
      ],
      "type": SimType.single
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
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "Any busses across our network",
      "price": "3.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "Any busses across our network",
      "price": "6.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "Any busses across our network",
      "price": "4.00",
      "state": States.conventry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    //black country

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daySaver,
      "subtitle": "All busses across our network",
      "price": "4.60",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.daysaverafter930monfri,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.daySaversatsun,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.eveningSaverafter6,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.day
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "7.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });
    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.blackCountry,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    //Sandwell & Dudley low fare zone

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daysaversandwellanddudley,
      "subtitle": "All busses in the Sandwell & Dudley zone",
      "price": "3.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses within the Sandwell & Dudley low fare zone."
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.sandwelldudleylowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    //wallsall low fare zone

    ticketTypes.add({
      "title": Ttype.singlejourney,
      "subtitle": "Any bus acorss our network",
      "price": "2.40",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.single
    });

    ticketTypes.add({
      "title": Ttype.daysaverwallsall,
      "subtitle": "All busses across our network",
      "price": "3.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our busses within the Wallsall low fare zone"
      ],
      "type": SimType.day
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaver,
      "subtitle": "All busses across our network",
      "price": "6.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    ticketTypes.add({
      "title": Ttype.groupdaysaverafter6,
      "subtitle": "All busses across our network",
      "price": "4.00",
      "state": States.wallsalllowfarzone,
      "info": [
        "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
      ],
      "type": SimType.group
    });

    /**
     * Importing all the metro tickets
     */

    ticketTypes.add({
      "title": Ttype.adult1weekMetro,
      "subtitle": "On Metro tram",
      "price": "23.00",
      "state": States.midlandmetra,
      "info": ["Includes travel on all the Midland Metro Trapm route."],
      "type": SimType.metro
    });

    ticketTypes.add({
      "title": Ttype.adult4weekMetro,
      "subtitle": "On Metro tram",
      "price": "81.00",
      "state": States.midlandmetra,
      "info": ["Includes travel on all the Midland Metro Trapm route."],
      "type": SimType.metro
    });

    ticketTypes.add({
      "title": Ttype.adult1weekMetroBus,
      "subtitle": "On Metro & all buses across our network",
      "price": "25.90",
      "state": States.midlandmetra,
      "info": [
        "Includes travel on all the Midland Metro Trapm route and all our busses across the West Midlands, Black Country & Conventry."
      ],
      "type": SimType.metro
    });

    ticketTypes.add({
      "title": Ttype.adulst4weekMetroBus,
      "subtitle": "On Metro & all buses across our network",
      "price": "90.85",
      "state": States.midlandmetra,
      "info": [
        "Includes travel on all the Midland Metro Trapm route and all our busses across the West Midlands, Black Country & Conventry."
      ],
      "type": SimType.metro
    });

    ticketTypes.add({
      "title": Ttype.student4WeekMetro,
      "subtitle": "On Metro & all buses across our network",
      "price": "63.00",
      "state": States.midlandmetra,
      "info": ["Include travel on all the Midland Metro Tram route."],
      "type": SimType.metro
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
      ],
      "type": SimType.uni
    });
    ticketTypes.add({
      "title": Ttype.universitySingleHop10,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "10.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Uni Hop short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ],
      "type": SimType.uni
    });
    ticketTypes.add({
      "title": Ttype.lemingtonSpaHop,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "1.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Lemington Spa short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ],
      "type": SimType.uni
    });
    ticketTypes.add({
      "title": Ttype.lemintonSpaHop10,
      "subtitle": "Any bus in the Warwick University Zone",
      "price": "10.00",
      "state": States.warwickUni,
      "info": [
        "Includes travel on all our busses within the Lemington Spa short hop zone.",
        "http://nxbus.co.uk/coventry/information/buses-to-from/buses-to-from-university-of-warwick"
      ],
      "type": SimType.uni
    });

    //this.init();
  }

  Future runInit() async {
    await Future.delayed(Duration(seconds: 1));
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
        "CREATE TABLE IF NOT EXISTS ticketwallet ( id integer  PRIMARY KEY AUTOINCREMENT, state text, tickettype text, tickettypeid text, expires text, isActive int, purchaseddate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,ticketid text,tag text)");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS tickets ( id integer  PRIMARY KEY AUTOINCREMENT, state text NOT NULL, tickettitle text NOT NULL,ticketsubtitle text NOT NULL, price text NOT NULL, info text NOT NULL, tag text NOT NULL)");

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
        var id = await this.addTicket(
            element['title'],
            element['state'],
            element['price'],
            element['subtitle'],
            element["info"][0],
            element["type"]);

        Future.delayed(Duration(seconds: 1));
        //saves to db
        //var title = element['title'];
      } else {
        // print("duplicates");
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
    /**
     * Get all tickets that were Auto-Purchaed by the system
     * these are to quickly get in to the ticket page without
     * buying tickets all the fuking time
     * for testing lol
     */
    List<Map> allAutoBuyTiks = await getAutoBuyTickets();

    allAutoBuyTiks.forEach((element) async {
      var id = element["id"];
      await deactivateTicket(id: id).then((value) {
        print("deactivated all tickets");
      });
    });

    /**
     * check current default 
     */
    SharedPreferences pref= await  SharedPreferences.getInstance();

    int defTicketID= pref.getInt(SettingsPrefKeys.DEFAULT_TICKET_KEY);
    print(">"+defTicketID.toString());

    List<Map> deftikData= await this.getTicketByID(defTicketID);

    print(deftikData[0]['state']);
    print(deftikData[0]['tickettype']);



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
          tickettype: curDefault[1],
          state: curDefault[0],
          price: "0.00",
          tag: "AUTO_BUY");
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
    List<Map> list =
        await db.rawQuery("SELECT * FROM tickets ORDER BY state desc");
    return list;
  }

  //get tickets by id
  /**
   * will grab a ticket by id
   * i dont know why the fuck i forgot to add this
   */

  Future getTicketByID(int id) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> one = await db.rawQuery("SELECT * FROM tickets WHERE id=?", [id]);
    return one;
  }

  EjectionSettingModel getEjectionSettingByID(String id) {
    List<EjectionSettingModel> allSettings = this.getAllEjectionSettings();
    EjectionSettingModel toReturn;

    allSettings.forEach((element) {
      if (element.id == id) {
        toReturn = element;
      }
    });
    return toReturn;
  }

  DefHomePageModel getDefHomeOptionById(String id) {
    List<DefHomePageModel> allSettings = this.getAllDefHomeOptions();
    DefHomePageModel toReturn;
    allSettings.forEach((element) {
      if (element.id == id) {
        toReturn = element;
      }
    });
    return toReturn;
  }

  List<DefHomePageModel> getAllDefHomeOptions() {
    List<DefHomePageModel> allHomePageSettings = new List();
    allHomePageSettings.add(DefHomePageModel(
        name: "Non Simulated (Home)",
        id: "non_sim_home",
        info:
            "In this view, you will see all the ticket types sectioned off and you can click on the ticket you want to activate. You also have extra butotns, its basically the quickest most efficent method of using the app but its not emersive."));

    allHomePageSettings.add(DefHomePageModel(
        name: "Simulated (Home)",
        id: "sim_home",
        info:
            "In this view, You will see the simulated home, aka the Clone real App."));

    allHomePageSettings.add(DefHomePageModel(
        name: "Ticket View",
        id: "sim_ticket_view",
        info:
            "In this view, The app will launch in ticket view. So as soon as you open the app it will go to the ticket view. Going back will follow the ejection rules."));

    allHomePageSettings.add(DefHomePageModel(
        name: "Demo Mode",
        id: "demo_mode",
        info:
            "In this view, You will access demo mode, here you can create your own tickets and have fun with the app."));
    return allHomePageSettings;
  }

  List<EjectionSettingModel> getAllEjectionSettings() {
    List<EjectionSettingModel> ejectionSettings = List<EjectionSettingModel>();
    ejectionSettings.add(EjectionSettingModel(
        id: "nothing",
        name: "Do Nothing",
        info:
            "Selecting this will ensure nothing happens when using the back button on the ticket page. Back button = null"));
    ejectionSettings.add(EjectionSettingModel(
        id: "simulated_real",
        name: "Simulated Real",
        info:
            "When clicking back, on the ticket page would take you to the simulated clone home page. Its the clone of the home page as well, where you can buy tickets and act like the real app. "));

    ejectionSettings.add(EjectionSettingModel(
        id: "launch_real",
        name: "Launch Real App",
        info:
            "Launch the real NX App when clicking back on the ticket page. This is for the most paranoid and risk averse people. True ninjas don't use this."));

    ejectionSettings.add(EjectionSettingModel(
        id: "fake_error",
        name: "Fake Error Message",
        info:
            "Shows a fake error message, can be used to bluff your way. Shows when clicking back from the ticket page."));
    return ejectionSettings;
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

  /*
   * Function to deactivate the ticket, normally used when the ticket expires but
   * we need to use it to deactivate all other tickets not currently the main one
   */
  Future deactivateTicket({@required id}) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var currentTime = new DateTime.now().microsecondsSinceEpoch;
    var updateid = await db.rawQuery(
        "UPDATE ticketwallet SET isActive=?,expires=?  WHERE id=?",
        [2, currentTime, id]);
    return updateid;
  }

  Future getAutoBuyTickets() async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> allTiksAutoBUy = await db
        .rawQuery("SELECT * FROM ticketwallet WHERE tag=?", ["AUTO_BUY"]);
    return allTiksAutoBUy;
  }

  //stores ticket in to db and generates a unique ID
  Future buyTicket(
      {@required tickettype, @required state, @required price, tag}) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var currentTime = new DateTime.now().millisecondsSinceEpoch;

    var id = await db.rawInsert(
        "INSERT INTO ticketwallet (state,tickettype,tickettypeid,expires,isActive,ticketid,tag) VALUES (?,?,?,?,?,?,?)",
        [state, tickettype, "not used", currentTime, -1, 3235346459, tag]);
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

  Future getTicketByState(String state) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list =
        await db.rawQuery("SELECT * FROM tickets WHERE state=?", [state]);
    return list;
  }

  Future getTicketsByTag(String type) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    List<Map> list =
        await db.rawQuery("SELECT * FROM tickets WHERE tag=?", [type]);
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
      String info, String tag) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    var iid = await db.rawInsert(
        "INSERT INTO tickets(tickettitle,state,price,ticketsubtitle,info,tag) VALUES (?,?,?,?,?,?)",
        [type, state, price, subtitle, info, tag]);
    return iid;
  }
}
