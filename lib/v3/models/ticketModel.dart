import 'package:flutter/material.dart';



class TicketModel{
  final String state;
  final String tickettitle;
  final String ticketsubtitle;
  final String price;
  final String info;
  final String tag;
  final String notusedexpiry;
  final String activefor;
  TicketModel({
    @required this.state,
    @required this.tickettitle,
    @required this.ticketsubtitle,
    @required this.price,
    @required this.info,
    @required this.tag,
    @required this.notusedexpiry,
    @required this.activefor,
  });
}