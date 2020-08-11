import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:BlackPie/v2/components/nxsig.dart';
import 'package:BlackPie/v2/components/ticketColor.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:BlackPie/v2/components/movingText.dart';
import 'package:BlackPie/v2/pages/overlays/ticketDetail.dart';
import 'package:BlackPie/v2/pages/overlays/actionsOverlay.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';

class ActualTicket extends StatefulWidget {
  final int txid;

  ActualTicket({@required this.txid}) {}

  @override
  State<StatefulWidget> createState() {
    return ActualTicketState();
  }
}

class ActualTicketState extends State<ActualTicket> {
  String state;
  String ticketTitle;
  List listOfQrCollections;
  String currentQR;

  Timer _qrTimer;

  @override
  void initState() {
    super.initState();

    listOfQrCollections = List();
    listOfQrCollections.add("images/v2/v2assets/bar1.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar2.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar3.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar4.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar5.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar6.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar7.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar8.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar9.PNG");
    listOfQrCollections.add("images/v2/v2assets/bar10.PNG");

    currentQR = listOfQrCollections[0];

    _qrTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      //grab random index
      Random rnd;
      int min = 0;
      int max = listOfQrCollections.length;
      rnd = new Random();
      var r = min + rnd.nextInt(max - min);
      setState(() {
        currentQR = listOfQrCollections[r];
      });
    });

    NXHelp().getTicketById(id: widget.txid).then((ticket) {
      setState(() {
        state = ticket[0]['state'];
        ticketTitle = ticket[0]['tickettype'];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _qrTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Nxfront()));
        return;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nxfront()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Text(
                        "Close",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )
                  ],
                ),
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
                        FutureBuilder(
                          future: NXHelp().loadSpeedConfigs(),
                          builder: (snapshot, ct) {
                          return Container(
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
                                      textContent: "$state $ticketTitle",
                                      isUpper: true,
                                    ))
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 190,
                            child: Image.asset(
                              currentQR,
                              width: 160,
                              height: 190,
                            )),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "ANY BUSES ACROSS OUR NETWORK",
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
                        Container(
                          height: 200,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 3),
                                  child: TicketColor(
                                    ctx: context,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 60,
                                left: 2,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 18, right: 0),
                                  child: Container(
                                      child: Column(
                                    children: <Widget>[
                                      Nxsig(
                                        isRounded: false,
                                        state: state,
                                        isBottomRounded: true,
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 10),
                          child: Container(
                            color: Color.fromRGBO(5, 126, 176, 1),
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
                                    icon: Icon(Icons.more_horiz),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "Actions",
                                    style: TextStyle(
                                        color: Color.fromRGBO(103, 119, 138, 1),
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
                                      builder: (context) => TicketDetail()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 17.0),
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.format_list_bulleted),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(103, 119, 138, 1),
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
          ),
        ),
      ),
    );
  }
}
