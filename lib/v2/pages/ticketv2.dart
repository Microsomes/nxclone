import 'dart:async';
import 'dart:math';

import 'package:BubbleGum/2022/Pages/nxpages/tripWallet.dart';
import 'package:BubbleGum/piHome.dart';
import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/components/nxsig.dart';
import 'package:BubbleGum/v2/components/ticketColor.dart';
import 'package:BubbleGum/v2/components/movingText.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketDetail.dart';
import 'package:BubbleGum/v2/pages/overlays/actionsOverlay.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../2022/2022helper.dart';
import '../../2022/Pages/nxpages/front.dart';
import 'overlays/v2/ejectionOverlay.dart';

class ActualTicket extends StatefulWidget {
  final int txid;

  ActualTicket({@required this.txid});

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
  Map speedConfig;
  String subtitle = "ANY BUSES ACROSS OUR NETWORK";

  int activeTicketID;

  bool showT = true;

  int currentPage = 1;

  void changeTicket({@required id}) {
    setState(() {
      showT = false;
      activeTicketID = id;
    });

    Future.delayed(Duration(milliseconds: 100), () {

          NXGetTicketDetails(activeTicketID).then((value) {
      NXFindRawTicket(value['ticketSubtitle'], value['ticketSubtitle2'],
              value['ticketName'])
          .then((value2) {
        setState(() {
          subtitle = value2['subline'];
          ticketTitle = value['ticketName'];
          state = value['ticketSubtitle2'];
                  showT = true;
        });
      });
    });
      
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      activeTicketID = widget.txid;
    });
    //block screenshots here

    print("BLOCKING SCREENSHOTS");

    //  Screen.setBrightness(1.0);

    // FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE)
    //     .then((value) {
    //   print("screenshots blocked");
    // });

    NXHelp().loadSpeedConfigs().then((speed) {
      print(speed);
      setState(() {
        speedConfig = speed;
      });
    });

    listOfQrCollections = [];
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

    // setState(() {
    //   state = "example state";
    //   ticketTitle = "example ticket title";
    //   subtitle = "example subtitle";
    // });

    NXGetTicketDetails(widget.txid).then((value) {
      NXFindRawTicket(value['ticketSubtitle'], value['ticketSubtitle2'],
              value['ticketName'])
          .then((value2) {
        setState(() {
          subtitle = value2['subline'];
          ticketTitle = value['ticketName'];
          state = value['ticketSubtitle2'];
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Screen.setBrightness(0.5);

    if(_qrTimer != null){
      _qrTimer.cancel();
    }

  }

  String defaultEjectionID;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          );
        }
        return state == null
            ? Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NxPagesFront()),
                            );
                            // Screen.setBrightness(0.1).then((value) {

                            // });
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 15),
                                  child: Text(
                                    "Close",
                                    style: GoogleFonts.roboto(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: showT == true
                                ? Column(
                                    children: [
                                      Expanded(
                                        child: Ac(
                                            changeTik: (int id) {
                                              changeTicket(id: id);
                                            },
                                            ticketid: activeTicketID,
                                            speedConfig: speedConfig,
                                            state: state,
                                            ticketTitle: ticketTitle,
                                            currentQR: currentQR,
                                            subtitle: subtitle,
                                            widget: widget),
                                      ),
                                      FutureBuilder(
                                          future: NXAllActiveTickets(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<Map> available =
                                                  snapshot.data;
                                              int l = available.length;

                                              if (available.length >= 2) {
                                                return Container(
                                                  height: 35,
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              if (currentPage <=
                                                                  1) {
                                                              } else {
                                                                currentPage--;
                                                                setState(() {});

                                                                changeTicket(
                                                                    id: available[
                                                                            currentPage-1]
                                                                        ['id']);
                                                              }
                                                            },
                                                            child: Icon(Icons
                                                                .chevron_left),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            "$currentPage of $l active",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {

                                                          
                                                              if (currentPage >=
                                                                  available
                                                                      .length) {
                                                              } else {
                                                                currentPage++;
                                                                setState(() {});
                                                                changeTicket(
                                                                    id: available[
                                                                            currentPage-1]
                                                                        ['id']);
                                                              }
                                                            },
                                                            child: Icon(Icons
                                                                .chevron_right),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 1,
                                                            blurRadius: 2,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ]),
                                                  ),
                                                );
                                              }
                                            }

                                            return Container();
                                          }),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class Ac extends StatelessWidget {
  const Ac(
      {Key key,
      @required this.changeTik,
      @required this.speedConfig,
      @required this.state,
      @required this.ticketTitle,
      @required this.currentQR,
      @required this.subtitle,
      @required this.widget,
      @required this.ticketid})
      : super(key: key);

  final int ticketid;
  final Function changeTik;
  final Map speedConfig;
  final String state;
  final String ticketTitle;
  final String currentQR;
  final String subtitle;
  final ActualTicket widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 10),
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
              TicketTopPart(
                  speedConfig: speedConfig,
                  state: state,
                  ticketTitle: ticketTitle),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: state == States.warwickUni ? 5 : 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                      child: TicketColor(
                        speed: 1000,
                        ctx: context,
                      ),
                    ),
                    Builder(
                      builder: (ctx) {
                        if (ticketTitle == "All Day- West Midlands" ||
                            ticketTitle == "Daysaver") {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: NXSigAnytime(
                              isGroup: false,
                            ),
                          );
                        } else if (ticketTitle == "Group") {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: NXSigAnytime(
                              isGroup: true,
                            ),
                          );
                        }

                        return OtherSig(ticketTitle: ticketTitle, state: state);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        print("Show rewards");

                        launchURL("https://www.nxbus.co.uk/rewards");
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 8),
                        child: Container(
                          color: Color.fromRGBO(5, 126, 176, 1),
                          height: 60,
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.launch,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "NX Rewards Cashback",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize: 19,
                                    letterSpacing: 0.3),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Subtitleticket(subtitle: subtitle),
                    SizedBox(
                      height: 10,
                    ),
                    QR(),
                  ],
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < 100; i++)
                      Container(
                        height: 1,
                        width: 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(103, 119, 138, 1)),
                      )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onLongPress: () {
                      print("open ejection overlay");
                      EjectionOverlay().display(context);
                    },
                    onTap: () {
                      ActionOverlay().display(context);
                    },
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.more_horiz,
                              color: Color.fromRGBO(103, 119, 138, 1)),
                          onPressed: () {},
                        ),
                        Text("Actions",
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Color.fromRGBO(5, 121, 160, 1),
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                content: TicketSwicher(
                                  changeTicket: (int id) {
                                    this.changeTik(id);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop('dialog');
                                  },
                                ),
                              ));
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TicketDetail(
                                  txid: ticketid,
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
                              color: Color.fromRGBO(5, 121, 160, 1),
                            ),
                            onPressed: () {},
                          ),
                          Text("Details",
                              style: GoogleFonts.roboto(
                                  color: Color.fromRGBO(5, 121, 160, 1),
                                  fontWeight: FontWeight.w800))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherSig extends StatelessWidget {
  const OtherSig({
    Key key,
    @required this.ticketTitle,
    @required this.state,
  }) : super(key: key);

  final String ticketTitle;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Nxsig(
        isRounded: ticketTitle == "Group Daysaver" ? true : false,
        state: state,
        isBottomRounded: true,
        ticketType: ticketTitle,
      ),
    );
  }
}

class NXSigAnytime extends StatelessWidget {
  final bool isGroup;

  const NXSigAnytime({Key key, @required this.isGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(165, 28, 26, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                  )),
              width: 18,
            ),
            Expanded(
              child: Container(
                  child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 15),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 215, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Image.asset("images/v6/vm.png"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width,
                            child: isGroup == true
                                ? Image.asset("images/v6/group.png")
                                : Image.asset("images/v6/adult.png"),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 217, 215, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            margin: EdgeInsets.all(4),
                          )),
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                          "images/v4/nationalexpress.png")),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 217, 215, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            margin: EdgeInsets.all(4),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
            Container(
              width: 18,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(165, 28, 26, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Subtitleticket extends StatelessWidget {
  const Subtitleticket({
    Key key,
    @required this.subtitle,
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 17,
              height: 1.2,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(
                110,
                107,
                110,
                1,
              ))),
    );
  }
}

class TicketTopPart extends StatelessWidget {
  const TicketTopPart({
    Key key,
    @required this.speedConfig,
    @required this.state,
    @required this.ticketTitle,
  }) : super(key: key);

  final Map speedConfig;
  final String state;
  final String ticketTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(165, 28, 26, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              left: 10,
              child: MovingText(
                velocity: 20,
                textContent: "$ticketTitle - $state",
                isUpper: false,
              ))
        ],
      ),
    );
  }
}

class TicketSwicher extends StatefulWidget {
  final Function changeTicket;
  const TicketSwicher({
    @required this.changeTicket,
    Key key,
  }) : super(key: key);

  @override
  _TicketSwicherState createState() => _TicketSwicherState();
}

class _TicketSwicherState extends State<TicketSwicher> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("kjnkj");
                          var state = States.westMidlands;
                          var type = Ttype.daySaver;

                          NXHelp()
                              .findTicketWithStateAndTitleID(
                                  state: state, title: type)
                              .then((value) {
                            if (value != null) {
                              TicketModel ticketData = value;
                              NXHelp()
                                  .buyTicketv2(
                                      ticketID: ticketData.id, tag: "AUTO_BUY")
                                  .then((value) {
                                var id = value;
                                widget.changeTicket(id);
                              });
                            }
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Day Saver",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("kjnkj");
                          var state = States.westMidlands;
                          var type = Ttype.groupdaysaver;

                          NXHelp()
                              .findTicketWithStateAndTitleID(
                                  state: state, title: type)
                              .then((value) {
                            if (value != null) {
                              TicketModel ticketData = value;
                              NXHelp()
                                  .buyTicketv2(
                                      ticketID: ticketData.id, tag: "AUTO_BUY")
                                  .then((value) {
                                var id = value;
                                widget.changeTicket(id);
                              });
                            }
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Group Saver",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => PiHome()));
                },
                child: Center(
                  child: Text("PI-Home"),
                ),
              ),
            )
          ],
        ));
  }
}

class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  var currentQR;
  var listOfQrCollections = [];

  Timer mainTimer;

  @override
  void dispose() {
    mainTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    mainTimer = Timer.periodic(Duration(seconds: 4), (timer) {
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

    listOfQrCollections = [];
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 230,
        child: Image.asset(
          currentQR,
          width: 220,
          height: 240,
        ));
  }
}
