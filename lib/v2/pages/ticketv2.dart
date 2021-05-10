import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:BubbleGum/piHome.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/components/nxsig.dart';
import 'package:BubbleGum/v2/components/ticketColor.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/components/movingText.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketDetail.dart';
import 'package:BubbleGum/v2/pages/overlays/actionsOverlay.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:app_launcher/app_launcher.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


  bool showT=true;
  


  void changeTicket({@required id}){
    setState(() {
      showT=false;
      activeTicketID=id;
    });
       NXHelp().getTicketWalletInfoByID(id: id).then((value) {
      List<TicketWalletModel> tikdata = value;

      tikdata[0].getTicketData().then((value) {
        TicketModel tkData = value;
        setState(() {
          state = tkData.state;
          ticketTitle = tkData.tickettitle;
          subtitle = tkData.ticketsubtitle;
        });
      });
    });
    Future.delayed(Duration(seconds: 1),(){
      setState((){
        showT=true;
      });
    });
  }
  

  @override
  void initState() {
    super.initState();
    setState(() {
      activeTicketID=widget.txid;
    });
    //block screenshots here

    print("BLOCKING SCREENSHOTS");

    // Screen.setBrightness(1.0);

    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE)
        .then((value) {
      print("screenshots blocked");
    });

    NXHelp().loadSpeedConfigs().then((speed) {
      print(speed);
      setState(() {
        speedConfig = speed;
      });
    });

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

    NXHelp().getTicketWalletInfoByID(id: activeTicketID).then((value) {
      List<TicketWalletModel> tikdata = value;

      tikdata[0].getTicketData().then((value) {
        TicketModel tkData = value;
        setState(() {
          state = tkData.state;
          ticketTitle = tkData.tickettitle;
          subtitle = tkData.ticketsubtitle;
        });
      });
    });

    // NXHelp().getTicketById(id: widget.txid).then((ticket) {
    //   print(ticket);
    //   print(widget.txid);

    //   setState(() {
    //     state = ticket["list"][0]['state'];
    //     ticketTitle = ticket["list"][0]['tickettype'];
    //     subtitle = ticket["subtitle"];
    //     print(state);
    //     print(ticketTitle);
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();

    Screen.setBrightness(0.5);

    _qrTimer.cancel();
  }

  String defaultEjectionID;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      SharedPreferences.getInstance().then((value) {
        if (value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY) != null) {
          setState(() {
            defaultEjectionID =
                value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY);
          });
          if (defaultEjectionID == "nothing") {
          } else {
            print(defaultEjectionID);
          }
        }
      });
      // //before we click the back button check user config for crash control
      // var ejectionSetting = await NXHelp().loadConfig("ejection", 1);
      // //grab the user selected error settings
      // print(ejectionSetting);
      // //stick to the default
      // if (ejectionSetting.length <= 0) {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Nxfront()));
      // } else if (ejectionSetting[0]["val"] == "crash") {
      //   print("crash");
      //   exit(0);
      // } else if (ejectionSetting[0]["val"] == "fakeerror") {
      //   print("fake error");
      //   exit(0);
      // } else if (ejectionSetting[0]["val"] == "launchapp") {
      //   LaunchReview.launch(androidAppId: "com.justride.nxwm");
      //   await AppLauncher.openApp(
      //     androidApplicationId: "com.justride.nxwm",
      //   );
      // }

      // //launch real app

      // //crash app/close app

      // //fake error message

      // return;
    }, child: FutureBuilder(
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
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nxfront()),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 10),
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      showT==true ?  Ac(
                            changeTik: (int id) {
                              changeTicket(id: id);
                            },
                            ticketid: activeTicketID,
                            speedConfig: speedConfig,
                            state: state,
                            ticketTitle: ticketTitle,
                            currentQR: currentQR,
                            subtitle: subtitle,
                            widget: widget):Container()
                      ],
                    ),
                  ),
                ),
              );
      },
    ));
  }
}

class Ac extends StatelessWidget {
  const Ac({
    Key key,
    @required this.changeTik,
    @required this.speedConfig,
    @required this.state,
    @required this.ticketTitle,
    @required this.currentQR,
    @required this.subtitle,
    @required this.widget,
    @required this.ticketid
  }) : super(key: key);

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
    return Expanded(
      child: Container(
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
                      color: Color.fromRGBO(165, 28, 26, 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                          left: 10,
                          child: MovingText(
                            velocity:
                                double.parse(speedConfig['top'][0]['val']),
                            textContent: "$state $ticketTitle",
                            isUpper: true,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                QR(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    subtitle.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(
                          110,
                          107,
                          110,
                          1,
                        )),
                  ),
                ),
                SizedBox(
                  height: state == States.warwickUni ? 5 : 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                  child: TicketColor(
                    speed: double.parse(speedConfig['bottom'][0]['val']),
                    ctx: context,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: Nxsig(
                    isRounded: ticketTitle == "Group Daysaver" ? true : false,
                    state: state,
                    isBottomRounded: true,
                    ticketType: ticketTitle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Show rewards");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 8),
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
                            color: Colors.white.withOpacity(0.7),
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
                ),
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
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
                SizedBox(
                  height: 3,
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
                                  color: Color.fromRGBO(5, 121, 160, 1),
                                  fontWeight: FontWeight.w800))
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
                                      Navigator.of(context, rootNavigator: true).pop('dialog');

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
                                      ticketID: ticketData.id, tag: "AUTO_BUY1")
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
                                      ticketID: ticketData.id, tag: "AUTO_BUY1")
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
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
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
  var listOfQrCollections = List();

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 190,
        child: Image.asset(
          currentQR,
          width: 180,
          height: 190,
        ));
  }
}
