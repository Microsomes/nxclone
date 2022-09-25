/**
 *  @author Micro
 *  @date 2022-09-24
 *  Helper file to handle wallet purchasing and record keeping
 */

import "package:sqflite/sqflite.dart";

Future<Database> openDB() async {
  const int version = 3;
  var db = await openDatabase('nx_' + version.toString() + '_test.db');
  return db;
}

Future<void> NXInitApp() async {
  var db = await openDB();
  await db.execute(
      'CREATE TABLE IF NOT EXISTS wallet (id INTEGER PRIMARY KEY AUTOINCREMENT, ticketName TEXT, ticketPrice TEXT, ticketSubtitle TEXT, ticketSubtitle2 TEXT, isActive INTEGER, purchasedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, activatedDate TIMESTAMP)');
  await Future.delayed(Duration(seconds: 1));
  return null;
}

Future<void> NXBuyTicket(
    String ticketName, String ticketSubtitle, String ticketSubtitle2, String ticketPrice) async {
  var db = await openDB();

  await db.rawInsert(
      "INSERT INTO wallet (ticketName,ticketPrice,ticketSubtitle, ticketSubtitle2 , isActive) VALUES (?,?,?,?,?)",
      [ticketName, ticketPrice, ticketSubtitle,ticketSubtitle2, -1]);

  return null;
}


Future GetFirstAvailableTicket() async {
  print("all tickets");
  var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=? ORDER BY id desc limit 1",[-1]);
  if(tickets.length>=1){
    return tickets[0];
  }else{
    return null;
  }  
}


Future<List> NXAllTicketsAvailable() async {
  print("all tickets");
  var db = await openDB();
  List<Map> tickets = await db
      .rawQuery("SELECT * FROM wallet WHERE isActive=?",[-1]);
  return tickets;
}

Future<Map> NXGetTicketDetails(int id) async {
  var db = await openDB();

  List<Map> tickets = await db.rawQuery("SELECT * FROM wallet WHERE id=?",[id]);

  Map selectedTicket= new Map();
  
  if(tickets.length>=1){
    selectedTicket = tickets[0];
  }else{
    selectedTicket= null;
  }
  print("------");
  print("="+selectedTicket['id'].toString());
  print("="+selectedTicket['ticketName'].toString());
  print("="+selectedTicket['ticketPrice'].toString());
  print("="+selectedTicket['ticketSubtitle'].toString());
  print("="+selectedTicket['ticketSubtitle2'].toString());

  return selectedTicket;
}

Future<void> ExpireTicket(int id) async {}
Future<void> clearAllTickets() async {}