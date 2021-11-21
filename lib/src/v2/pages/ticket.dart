import 'package:bubble_gum/src/v3/models/ticketModel.dart';
import 'package:bubble_gum/src/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:bubble_gum/src/v2/components/nxsig.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/pages/overlays/ticketPreActivate.dart';
import 'package:bubble_gum/src/v2/components/movingText.dart';
import 'package:bubble_gum/src/v2/pages/overlays/ticketDetail.dart';
import 'package:bubble_gum/src/v2/pages/overlays/actionsOverlay.dart';
import 'package:google_fonts/google_fonts.dart';

class Ticket2 extends StatefulWidget {
  final int txdbid;

  Ticket2({@required this.txdbid});

  @override
  State<StatefulWidget> createState() {
    return Ticket2State();
  }
}

class Ticket2State extends State<Ticket2> {
  var currentTicket;
  //will load the current ticket

  String state = "klkjn";

  String tickettype = "jknhjb";

  @override
  void initState() {
    super.initState();

    NXHelp().getTicketWalletInfoByID(id: widget.txdbid).then((value) {
      List<TicketWalletModel> allT = value;

      allT[0].getTicketData().then((value) {
        TicketModel tikData = value;
        setState(() {
          state = tikData.state;
          tickettype = tikData.tickettitle;
          currentTicket = "d";
        });
      });
    });

    // NXHelp().getTicketById(id: widget.txdbid).then((ticket) {
    //   if (ticket.length == 0) {
    //     //ticket invalid
    //     throw ("invalid ticket");
    //   } else {
    //     setState(() {
    //       currentTicket = ticket["list"][0];
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
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
                          child: Text("Close",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              child: Text(
                                "ACTIVATE JUST BEFORE BOARDING",
                                textAlign: TextAlign.center,
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 6),
                              child: InkWell(
                                onTap: () {
                                  //displayActivationDialog(context);
                                  TicketOverlayHelper().displayActivationDialog(
                                      context, widget.txdbid);
                                },
                                child: Container(
                                  color: Color.fromRGBO(46, 150, 32, 1),
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      "Activate Ticket",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 0.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 10),
                              child: Container(
                                color: Color.fromRGBO(26, 108, 151, 1),
                                height: 60,
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
                                          color:
                                              Color.fromRGBO(103, 119, 138, 1),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Actions",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                103, 119, 138, 1),
                                            fontWeight: FontWeight.w500),
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
                                            color: Color.fromRGBO(
                                                103, 119, 138, 1),
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 119, 138, 1),
                                              fontWeight: FontWeight.w500),
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
