import 'package:flutter/material.dart';
import 'package:BlackPie/components/daysaveractive.dart';
import 'package:BlackPie/pages/help.dart';
import 'package:BlackPie/pages/offers.dart';
import 'package:BlackPie/pages/selectticket.dart';
import 'package:BlackPie/pages/ticketwallet.dart';
import 'package:BlackPie/pages/tripTools.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/pages/ticket.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import 'package:google_fonts/google_fonts.dart';

class Nxfront extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NxfrontState();
  }
}

class NxfrontState extends State<Nxfront> {
  var lins = 1;
  double heightOf = 60;
  double spaceApart = 23;

  int defaultTicketid;

  String state = "";
  String tickettype = "";

  final double _letterSpaceing = 0.8;

  @override
  void initState() {
    super.initState();

    //call method to grab a preactivated default ticket useful
    NXHelp().buyAndActivateDefaultTicket().then((preactivatedid) {
      setState(() {
        defaultTicketid = preactivatedid['ticketid'];
        state = preactivatedid['state'];
        tickettype = preactivatedid['tickettype'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
          body: Container(
              height: 1000,
              width: double.infinity,
              color: Color.fromRGBO(169, 27, 26, 1),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 16,
                            right: 5,
                            child: Image.asset(
                              "images/v3/bar.png",
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectTicket()),
                              );
                            },
                            focusColor: Colors.red,
                            highlightColor: Colors.pink,
                            child: Container(
                              width: 380,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/busicon.png",
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text("Buy tickets",
                                    style: GoogleFonts.roboto(
                                        letterSpacing: _letterSpaceing,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: spaceApart,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Offers()),
                              );
                            },
                            child: Container(
                              width: 380,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/offers.png",
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Offers",
                                  style: GoogleFonts.roboto(
                                      letterSpacing: _letterSpaceing,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: spaceApart,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ticketwallet()),
                              );
                            },
                            child: Container(
                              width: 370,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/wallet.png",
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  "Ticket wallet",
                                  style: GoogleFonts.roboto(
                                      letterSpacing: _letterSpaceing,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            height: 189,
                            width: sizeW * 0.96,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(123, 26, 17, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 14,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Ticket2(
                                                    txdbid: 0,
                                                  )));
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ActualTicket(
                                                        txid:
                                                            defaultTicketid)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 3),
                                        child: Container(
                                          height: 123,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.92,
                                          child: TicketTwo(
                                            state: state,
                                            tickettype: tickettype,
                                            id: defaultTicketid,
                                            whenActivated:
                                                "Expires in 12 hours, 54 minutes",
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 17),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Ticketwallet()));
                                      //Ticketwallet
                                    },
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        width: sizeW,
                                        height: 17,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "MORE TICKETS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              "images/rightwhite.png",
                                              width: 15,
                                            ),
                                            SizedBox(
                                              width: 12,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: spaceApart,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Triptools()),
                              );
                            },
                            child: Container(
                              width: 380,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/triptool.png",
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Trip tools",
                                  style: GoogleFonts.roboto(
                                      letterSpacing: _letterSpaceing,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: spaceApart,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Help()),
                              );
                            },
                            child: Container(
                              width: 380,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/ottom.png",
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Help",
                                  style: GoogleFonts.roboto(
                                      letterSpacing: _letterSpaceing,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 300,
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ))),
    );
  }
}
