import 'package:flutter/material.dart';
import 'package:bubble_gum/src/v2/components/nxsig.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/components/movingText.dart';
import 'package:bubble_gum/src/v2/pages/overlays/ticketDetail.dart';
import 'package:bubble_gum/src/v2/pages/overlays/actionsOverlay.dart';
import 'package:google_fonts/google_fonts.dart';

class UsedTicketPage extends StatefulWidget {
  final int txdbid;

  UsedTicketPage({@required this.txdbid});

  @override
  State<StatefulWidget> createState() {
    return Ticket2State();
  }
}

class Ticket2State extends State<UsedTicketPage> {
  var currentTicket;
  //will load the current ticket

  @override
  void initState() {
    super.initState();

    NXHelp().getTicketById(id: widget.txdbid).then((ticket) {
      if (ticket.length == 0) {
        //ticket invalid
        throw ("invalid ticket");
      } else {
        setState(() {
          currentTicket = ticket["list"][0];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = currentTicket['state'];
    var tickettype = currentTicket['tickettype'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: currentTicket != null
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Text(
                            "Close",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(117, 28, 21, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                      left: 10,
                                      child: MovingText(
                                        textContent: "$state $tickettype",
                                        isUpper: true,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "ANY BUS ACROSS OUR NETWORK",
                                style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                      124,
                                      126,
                                      136,
                                      1,
                                    )),
                              ),
                            ),
                            Container(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Nxsig(
                                    isRounded: true,
                                    state: state,
                                  )),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "Used on 28 Mar 2021 04:07",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 00),
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 8),
                              child: Container(
                                color: Color.fromRGBO(26, 108, 151, 1),
                                height: 52,
                                child: Center(
                                    child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.launch,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "NX Rewards Cashback",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 0.3),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            Expanded(child: Text("")),
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    ActionOverlay().display(context);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.more_horiz,
                                          color: Color.fromRGBO(5, 121, 160, 1),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Actions",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(5, 121, 160, 1),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TicketDetail(
                                                txid: widget.txdbid,
                                                isDaysLeft: true,
                                              )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 17.0),
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.format_list_bulleted,
                                            color:
                                                Color.fromRGBO(5, 121, 160, 1),
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  5, 121, 160, 1),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}
