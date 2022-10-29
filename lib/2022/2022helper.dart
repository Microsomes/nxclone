/**
 *  @author Micro
 *  @date 2022-09-24
 *  Helper file to handle wallet purchasing and record keeping
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import "package:sqflite/sqflite.dart";
import 'package:intl/intl.dart';


Future<Database> openDB() async {
  const int version = 3;
  var db = await openDatabase('nx_' + version.toString() + '_test.db');
  return db;
}

//ticket statuses
// -1 = purchased but not used
// 0 = used
// 1 = active




Future<void> NXInitApp() async {
  var db = await openDB();
  await db.execute(
      'CREATE TABLE IF NOT EXISTS wallet (id INTEGER PRIMARY KEY AUTOINCREMENT, ticketName TEXT, ticketPrice TEXT, ticketSubtitle TEXT, ticketSubtitle2 TEXT, isActive INTEGER, purchasedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, activatedDate TIMESTAMP)');

  await db.execute(
    "CREATE TABLE IF NOT EXISTS account (id INTEGER PRIMARY KEY AUTOINCREMENT, accountEmail TEXT, accountPassword TEXT)"
  );

  return null;
}



Future NXCalculateWhenInActiveTicketExpire(int id) async {
   var db = await openDB();
  var result = await db.rawQuery(
      'SELECT * FROM wallet WHERE id =?',[id]);

    if(result[0]['isActive'] == -1){
      var purchaseDate = result[0]['purchasedDate'];

      var expiredIn = DateTime.parse(purchaseDate).add(Duration(days: 3));

      var now = DateTime.now();

      if(now.isAfter(expiredIn)){
        await db.rawUpdate('UPDATE wallet SET isActive = 0 WHERE id = ?', [id]);
      }

      //difference in days and hours
      var difference = expiredIn.difference(now);
      var days = difference.inDays;
      var hours = difference.inHours;

      var daysLeft = days.toString();
      var hoursLeft = (hours - (days * 24)).toString();

      return [days,hoursLeft];
    }
}

Future NXCalculateWhenActiveTicketExpire(int id) async {
 
  var db = await openDB();
  var result = await db.rawQuery(
      'SELECT * FROM wallet WHERE id =?',[id]);
  
  var activatedDate = result[0]['activatedDate'];

   var purchaseDate = result[0]['purchasedDate'];

  // //check hours until next day
  var now = DateTime.now();

  //check hours until ticket expires
  var ticketActivatedDate = DateTime.parse(activatedDate);
  var ticketExpires = DateTime(ticketActivatedDate.year, ticketActivatedDate.month, ticketActivatedDate.day + 1);
  var hoursUntilTicketExpires = ticketExpires.difference(now).inHours;

  //var days left and hours left and minutes left
  var daysLeft = ticketExpires.difference(now).inDays;
  var hoursLeft = (hoursUntilTicketExpires - (daysLeft * 24)).toString();
  var minutesLeft = (ticketExpires.difference(now).inMinutes - (hoursUntilTicketExpires * 60)).toString();

  var expiredDate = DateTime(ticketActivatedDate.year, ticketActivatedDate.month, ticketActivatedDate.day + 1);


    DateFormat dateFormatDate = DateFormat("dd MMM yyyy");
    DateFormat dateFormatTime = DateFormat("HH:mm");
    var formattedDate = dateFormatDate.format(expiredDate);


    var activatedFomattedDate = dateFormatDate.format(ticketActivatedDate);

    var purchasedDateFormat = dateFormatDate.format(DateTime.parse(purchaseDate));
    var purchaseDateTimeFormat = dateFormatTime.format(DateTime.parse(purchaseDate));

  return [daysLeft,hoursLeft,minutesLeft,formattedDate, activatedFomattedDate,purchasedDateFormat,purchaseDateTimeFormat];
}

Future NXBuyTicket(String ticketName, String ticketSubtitle,
    String ticketSubtitle2, String ticketPrice) async {
  var db = await openDB();

  return await db.rawInsert(
      "INSERT INTO wallet (ticketName,ticketPrice,ticketSubtitle, ticketSubtitle2 , isActive) VALUES (?,?,?,?,?)",
      [ticketName, ticketPrice, ticketSubtitle, ticketSubtitle2, -1]);
}

Future activateTicket(int id) async {
  var db = await openDB();
  return await db.rawUpdate(
      "UPDATE wallet SET isActive = 1, activatedDate = CURRENT_TIMESTAMP WHERE id = ?",
      [id]);
}

Future<int> NXBuyDaysaverTicket() async {

  //before we buy lets find one already active
  var db = await openDB();
  var result = await db.rawQuery(
      'SELECT * FROM wallet WHERE ticketName =? AND isActive = 1',["All Day- West Midlands"]);

  if(result.length > 0){
    print("found already active ticket");
    return result[0]['id'];
  }

  var id = await NXBuyTicket("All Day- West Midlands", "Singles & Daysavers",
      "Anytime Daysaver Tickets", "4,00");
  activateTicket(id);
  return id;
}

Future<int> NXBuyGroupSaver() async {
  var db = await openDB();
  var result = await db.rawQuery(
      'SELECT * FROM wallet WHERE ticketName =? AND isActive = 1',["Group"]);
    
  if(result.length > 0){
    print("found already active ticket");
    return result[0]['id'];
  }

   var id = await NXBuyTicket("Group", "Singles & Daysavers",
      "Group Daysaver Tickets", "7,00");
  activateTicket(id);
  return id;
}

Future GetAllActivatedTickets() async {
  var db = await openDB();
  var res = await db.rawQuery("SELECT * FROM wallet WHERE isActive = 1");
  return res;
}

Future GetFirstAvailableTicket() async {
  print("all tickets");
  var db = await openDB();

  List<Map> activatedTickets = await GetAllActivatedTickets();

  if (activatedTickets.length == 0) {
    List<Map> tickets = await db.rawQuery(
        "SELECT * FROM wallet WHERE isActive=? ORDER BY id desc limit 1",
        [1, -1]);
    if (tickets.length >= 1) {
      return tickets[0];
    } else {
      return null;
    }
  } else {
    return activatedTickets[0];
  }
}

Future<List> NXAllActiveTickets() async {
    var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=? ORDER BY id desc", [1]);
  return tickets;
}

Future<List> NXAllTicketsAvailable() async {
  print("all tickets");
  var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=? ORDER BY id desc", [-1]);

  List<Map> activeTickets = await db.rawQuery("SELECT * from wallet WHERE isActive=? ORDER BY id desc",[1]);
  return [tickets,activeTickets];
}

Future<List> NXAllUsedTickets() async {
  print("all used tickets");
  var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=? ORDER BY id desc", [0]);
  return tickets;
}

Future<Map> NXGetTicketDetails(int id) async {
  var db = await openDB();

  List<Map> tickets =
      await db.rawQuery("SELECT * FROM wallet WHERE id=?", [id]);

  Map selectedTicket = new Map();

  if (tickets.length >= 1) {
    selectedTicket = tickets[0];
  } else {
    selectedTicket = null;
  }

  return selectedTicket;
}

Future NXChangelogs() async {
  final String response = await rootBundle.loadString('assets/changelogs.json');
  final data = await json.decode(response);
  return data;
}

Future NXFindRawTicket(String title, subtitle2, name) async {
  print("finding ticket:" + name);
  final String response = await rootBundle.loadString("assets/tickets.json");
  final data = await jsonDecode(response);

  var ticketRawDetails = data["sections"][title]['sections'][subtitle2][name];

  return ticketRawDetails;
}

Future NXALLRawTickets() async {
  print("finding ticket:");
  final String response = await rootBundle.loadString("assets/tickets.json");
  final data = await jsonDecode(response);

  return data;
}

Future<int> CheckTicketsForExpiry() async {
  var db = await openDB();

  var Box = await GetStorage();

  var where = Box.read("BubbleGumSettings");


  print("check for expiry");

  List<Map> tickets =
      await db.rawQuery("select * from wallet"); //scans all tickets

  tickets.forEach((element) {
    print(element['id']);
    print(element['isActive']);
    print(element['purchasedDate']);

    if (element['isActive'] == -1) {
      //ticket is not activated check if it was brought more then 3 days ago
      var date = DateTime.parse(element['purchasedDate']);
      //elapsed in hours from date

      var now = DateTime.now();
      var differenceMins = now.difference(date).inMinutes;

      if (differenceMins >= Duration(days: 3).inMinutes) {
        db.rawUpdate(
            "UPDATE wallet SET isActive=? WHERE id=?", [0, element['id']]);
      }
    }else if(element['isActive'] == 1){
      //ticket is activated check if it was brought more then 1 day ago
      var date = DateTime.parse(element['activatedDate']);
      //elapsed in hours from date

      var now = DateTime.now();
      var differenceMins = now.difference(date).inMinutes;

      //how many hours left in the day it was purchased
      var hoursLeft = 24 - date.hour;

      print(differenceMins);
      print(Duration(hours: hoursLeft).inMinutes);

      if (differenceMins >= Duration(hours: hoursLeft).inMinutes) {
        db.rawUpdate(
            "UPDATE wallet SET isActive=? WHERE id=?", [0, element['id']]);
      }
    }
  });


  if(where == "DaySaver"){
    var daysaverid = await  NXBuyDaysaverTicket();
    return daysaverid;
  } else if(where == "Group DaySaver"){
    return await NXBuyGroupSaver();
  }
  else{
    return 0;
  }

}

NXDeleteAllTickets() async {
  var db = await openDB();
  await db.rawDelete("DELETE FROM wallet");
}

Future<void> ExpireTicket(int id) async {}
Future<void> clearAllTickets() async {}
