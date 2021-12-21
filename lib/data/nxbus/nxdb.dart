import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class NXDatabase {
  static const DB_NAME = "main_new18.db";

  Future getDbInstance() async {
    return openDatabase(DB_NAME);
  }

  final database =
      openDatabase(DB_NAME, version: 1, onCreate: (db, version) async {
    var batch = db.batch();

    //create nx_tickets table
    batch.rawQuery(
        'CREATE TABLE nx_tickets(id integer AUTO_INCREMENT, name text NOT NULL, price text NOT NULL, subline text NOT NULL, parentCatrgory text NOT NULL, childCategory text NOT NULL, PRIMARY KEY(id))');

    //create user account table, to store registered accounts

    batch.rawQuery(
        'CREATE TABLE nx_account(id integer AUTO_INCREMENT,PRIMARY KEY(id), emailAddress text, password text)');

    //create ticket wallet table to store purchased tickets

    batch.rawQuery(
        'CREATE TABLE nx_wallet(id integer AUTO_INCREMENT,PRIMARY KEY(id), ticketid integer, purchased TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');

    final String response = await rootBundle.loadString('assets/tickets.json');
    final data = await json.decode(response);

    Map sections = data['sections'];

    print(sections.length);
    sections.forEach((key, value) {
      var parentCategory = key;

      print(parentCategory);

      var innerSections = value['sections'];

      innerSections.forEach((key, value) {
        var childCategory = key;

        value.forEach((key, val) {
          var ticketTitle = key;
          var ticketPrice = val['price'];
          var ticketSubline = val['subline'];

          //inserting data
          batch.insert('nx_tickets', {
            'name': ticketTitle,
            'price': ticketPrice,
            'subline': ticketSubline,
            'parentCatrgory': parentCategory,
            'childCategory': childCategory
          });
        });
      });
    });

    batch.commit();

    return batch;
  });
}