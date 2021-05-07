import 'package:flutter/material.dart';

import '../../v2/helper/NxHelp.dart';

import './ticketModel.dart';

class TicketWalletModel{
  final int id;
  final int ticketid;
  final int activeStatus;
  final int whenActivated;
  final int whenExpired;
  final int created;
  final String cardLast4;
  final String tag;



  Future setInactive() async {
    await NXHelp().deactivateTicketv2(id: this.id); 
  }

  Future getTicketData() async {
    return  await NXHelp().getTicketByIDV2(this.ticketid);
  }

  Future getTimeRemaining() async{
    TicketModel timeRemaining=  await this.getTicketData();
    var activeForMilli= int.parse(timeRemaining.activefor);
    var toC= activeForMilli+=this.whenActivated;
    DateTime activeForDate= DateTime.fromMillisecondsSinceEpoch(toC);
    DateTime cur= DateTime.now();
    return activeForDate.difference(cur).inMinutes;
  }


  DateTime getTimeCreated(){
    return DateTime.fromMillisecondsSinceEpoch(this.created);
  }

  String getTimeCreatedHuman(){
    DateTime d= this.getTimeCreated();
    return d.day.toString()+"/"+d.month.toString()+"/"+d.year.toString()+"("+d.hour.toString()+":"+d.minute.toString()+":"+d.second.toString()+")";
  }


   DateTime getWhenActivated(){
    return DateTime.fromMillisecondsSinceEpoch(this.whenActivated);
  }

  String getWhenActivateddHuman(){
    DateTime d= this.getWhenActivated();
    return d.day.toString()+"/"+d.month.toString()+"/"+d.year.toString()+"("+d.hour.toString()+":"+d.minute.toString()+":"+d.second.toString()+")";
  }
 
  
  TicketWalletModel({
    @required this.id,
    @required this.ticketid,
    @required this.created,
    this.activeStatus,
    this.whenActivated,
    this.whenExpired,
    this.cardLast4,
    this.tag
  });
}