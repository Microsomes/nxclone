import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var state = widget.state;


  

    if (widget.state == "Sandwell & Dudley Low Fare Zone") {
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
    }else if(widget.ticketType==Ttype.adult1weekMetro){
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/metro.png"),
      );
    }else if(widget.ticketType==Ttype.adult4weekMetro){
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/metro.png"),
      );
    }else if(widget.ticketType==Ttype.adult1weekMetroBus){
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/reg-metro.png")
      );
    }else if(widget.ticketType==Ttype.adulst4weekMetroBus{
      return Container(
        child: Image.asset("images/v4/nxsig/finalsig/reg-metro.png")
      );
    }

    return Container(
      decoration: BoxDecoration(
          color: widget.ticketType == "Group Daysaver"
              ? Color.fromRGBO(208, 112, 146, 0.4)
              : Color.fromRGBO(248, 233, 226, 1),
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(widget.isBottomRounded == true ? 10 : 0),
              bottomRight:
                  Radius.circular(widget.isBottomRounded == true ? 10 : 0))),
      height: 140,
      child: Column(
        children: <Widget>[
          Container(
            height: 18,
            decoration: BoxDecoration(
                color: Color.fromRGBO(162, 31, 41, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(widget.isRounded == true ? 10 : 0),
                  topLeft: Radius.circular(widget.isRounded == true ? 10 : 0),
                )),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  "$state",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "mTicket",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Expanded(
            child: widget.ticketType == "Group Daysaver"
                ? Container(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "GROUP",
                            style: GoogleFonts.oswald(
                                fontSize: 40,
                                color: Color.fromRGBO(204, 114, 149, 1)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "up to 5 people or 2 adults + 4 children",
                            style: GoogleFonts.oswald(
                                fontSize: 20,
                                color: Color.fromRGBO(204, 114, 149, 1)),
                          )
                        ],
                      )
                    ],
                  ))
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.company.split(" ")[0],
                            style: TextStyle(
                                color: Color.fromRGBO(205, 192, 201, 1),
                                letterSpacing: 0.1,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.company.split(" ")[1],
                            style: TextStyle(
                                color: Color.fromRGBO(205, 192, 201, 1),
                                height: 0.55,
                                letterSpacing: 0.1,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          "$state",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(239, 193, 193, 1),
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
