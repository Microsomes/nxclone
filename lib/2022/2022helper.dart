/**
 *  @author Micro
 *  @date 2022-09-24
 *  Helper file to handle wallet purchasing and record keeping
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import "package:sqflite/sqflite.dart";

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
  await Future.delayed(Duration(seconds: 1));
  return null;
}


Future NXCalculateWhenTicketExpire(int id) async {
 
  var db = await openDB();
  var result = await db.rawQuery(
      'SELECT activatedDate FROM wallet WHERE id =?',[id]);
  
  var activatedDate = result[0]['activatedDate'];

  // //check hours until next day
  var now = DateTime.now();

  //check hours until ticket expires
  var ticketActivatedDate = DateTime.parse(activatedDate);
  var ticketExpires = DateTime(ticketActivatedDate.year, ticketActivatedDate.month, ticketActivatedDate.day + 1);
  var hoursUntilTicketExpires = ticketExpires.difference(now).inHours;


  return hoursUntilTicketExpires;
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

Future<void> NXBuyDaysaverTicket() async {
  var id = await NXBuyTicket("All Day- West Midlands", "Singles & Daysavers",
      "Anytime Daysaver Tickets", "4,00");
  activateTicket(id);
  print("ticket activated");
}

Future<void> NXBuyGroupSaver() async {}

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
        "SELECT * FROM wallet WHERE IN isActive=? ORDER BY id desc limit 1",
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

Future<List> NXAllTicketsAvailable() async {
  print("all tickets");
  var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=? ORDER BY id desc", [-1]);
  return tickets;
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

Future CheckTicketsForExpiry() async {
  var db = await openDB();

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
    }
  });
}

NXDeleteAllTickets() async {
  var db = await openDB();
  await db.rawDelete("DELETE FROM wallet");
}

Future<void> ExpireTicket(int id) async {}
Future<void> clearAllTickets() async {}
