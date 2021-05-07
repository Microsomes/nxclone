import 'package:flutter/material.dart';

import '../../v2/helper/NxHelp.dart';

import './ticketModel.dart';

class TicketWalletModel {
  final int id;
  final int ticketid;
  final int activeStatus;
  final int whenActivated;
  final int whenExpired;
  final int created;
  final String cardLast4;
  final String tag;

  Future setActive() async {
    //verifies if it hasnt already expired;
    return await NXHelp().activeTicketv2(id: this.id);
  }

  Future setInactive() async {
    await NXHelp().deactivateTicketv2(id: this.id);
  }

  Future getTicketData() async {
    return await NXHelp().getTicketByIDV2(this.ticketid);
  }

  Future getTimeRemaining() async {
    TicketModel timeRemaining = await this.getTicketData();
    var activeForMilli = int.parse(timeRemaining.activefor);
    var toC = activeForMilli += this.whenActivated;
    DateTime activeForDate = DateTime.fromMillisecondsSinceEpoch(toC);
    DateTime cur = DateTime.now();
    return activeForDate.difference(cur).inMinutes;
  }

  Future getTimeRemainingIdle() async {
    TicketModel timeRemaining = await this.getTicketData();
    var activeForMilli = int.parse(timeRemaining.notusedexpiry);
    var toC = activeForMilli += this.created;

    DateTime activeForDate = DateTime.fromMillisecondsSinceEpoch(toC);
    DateTime cur = DateTime.now();
    return activeForDate.difference(cur).inDays;
  }

  /**
   * the ticket wasnt used so it expired and was not used
   */
  Future setExpireTicket() {
    this.getTimeRemainingIdle().then((value) {
      if (value <= -1) {
        NXHelp().expireTicketv2(id: this.id).then((value) {
          print(value);
        });
      }else{
        print("Cannot expire the ticket since theirs still time");
      }
    });
  }

  DateTime getTimeCreated() {
    return DateTime.fromMillisecondsSinceEpoch(this.created);
  }

  String getTimeCreatedHuman() {
    DateTime d = this.getTimeCreated();
    return d.day.toString() +
        "/" +
        d.month.toString() +
        "/" +
        d.year.toString() +
        "(" +
        d.hour.toString() +
        ":" +
        d.minute.toString() +
        ":" +
        d.second.toString() +
        ")";
  }

  DateTime getWhenActivated() {
    return DateTime.fromMillisecondsSinceEpoch(this.whenActivated);
  }

  String getWhenActivateddHuman() {
    DateTime d = this.getWhenActivated();
    return d.day.toString() +
        "/" +
        d.month.toString() +
        "/" +
        d.year.toString() +
        "(" +
        d.hour.toString() +
        ":" +
        d.minute.toString() +
        ":" +
        d.second.toString() +
        ")";
  }

  TicketWalletModel(
      {@required this.id,
      @required this.ticketid,
      @required this.created,
      this.activeStatus,
      this.whenActivated,
      this.whenExpired,
      this.cardLast4,
      this.tag});
}
