import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:flutter/material.dart';

class Nxsig extends StatefulWidget {
  final bool isRounded;
  final bool isBottomRounded;

  final String state;

  final String company;

  final String ticketType;

  Nxsig(
      {@required this.isRounded,
      @required this.state,
      this.isBottomRounded = false,
      this.company = "national express",
      this.ticketType});

  @override
  State<StatefulWidget> createState() {
    return NxsigState();
  }
}

class NxsigState extends State<Nxsig> {
  @override
  Widget build(BuildContext context) {
    if (widget.ticketType == "16 to 18 Child Daysaver") {
      return Image.asset("images/v4/nxsig/finalsig/1618.png");
    } else if (widget.state == "Sandwell & Dudley Low Fare Zone") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/sandwell-dudley.png"),
      );
    } else if (widget.state == "Black Country") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/black_country.png"),
      );
    } else if (widget.ticketType == "Group Daysaver after 6pm") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/groupdaysaver.png"),
      );
    } else if (widget.ticketType == "Daysaver") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/westmidlands.png"),
      );
    } else if (widget.ticketType == "Single Journey") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/westmidlands.png"),
      );
    } else if (widget.ticketType == "Group Daysaver") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/groupdaysaver.png"),
      );
    } else if (widget.ticketType == "Group Daysaver after 6pm") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/westmidlands.png"),
      );
    } else if (widget.state == "Coventry") {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/conventrysig.png"),
      );
    } else if (widget.ticketType == Ttype.adult1weekMetro) {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/metro.png"),
      );
    } else if (widget.ticketType == Ttype.adult4weekMetro) {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/metro.png"),
      );
    } else if (widget.ticketType == Ttype.adult1weekMetroBus) {
      return Container(
          child: Image.asset("images/v4/nxsig/finalsig/reg-metro.png"));
    } else if (widget.ticketType == Ttype.adulst4weekMetroBus) {
      return Container(
          child: Image.asset("images/v4/nxsig/finalsig/reg-metro.png"));
    } else if (widget.ticketType == Ttype.universitySingleHop) {
      return Container(
          child: Image.asset("images/v4/nxsig/finalsig/university.png"));
    } else if (widget.ticketType == Ttype.universitySingleHop10) {
      return Container(
          child: Image.asset("images/v4/nxsig/finalsig/university.png"));
    } else {
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/westmidlands.png"),
      );
    }
  }
}
