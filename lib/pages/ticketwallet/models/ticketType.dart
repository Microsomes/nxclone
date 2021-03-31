import 'package:flutter/material.dart';

/*
 * Modle for ticket to better handle the 
 * expiry logic and make the code a fuck ton neater
 */
class TicketModel{
    final int id;
    final String state;
    final String tickettype;
    final String expires;
    final int isActive;
    final String purchaseDate;
    final String ticketid;
    final String tag;

    TicketModel({
      @required this.id,
      @required this.state,
      @required this.tickettype,
      @required this.expires,
      @required this.isActive,
      @required this.purchaseDate,
      @required this.ticketid,
      @required this.tag
    });
}