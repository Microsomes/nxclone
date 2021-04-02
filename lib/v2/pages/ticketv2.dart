import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/components/nxsig.dart';
import 'package:BubbleGum/v2/components/ticketColor.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/components/movingText.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketDetail.dart';
import 'package:BubbleGum/v2/pages/overlays/actionsOverlay.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:launch_review/launch_review.dart';
import 'package:app_launcher/app_launcher.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:screen/screen.dart';



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

  String subtitle="ANY BUSES ACROSS OUR NETWORK";

  

  @override
  void initState() {
    super.initState();


    //block screenshots here

    print("BLOCKING SCREENSHOTS");

    Screen.setBrightness(1.0);


    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE).then((value){
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
      print(ticket);
      print(widget.txid);

      setState(() {
        state = ticket["list"][0]['state'];
        ticketTitle = ticket["list"][0]['tickettype'];
        subtitle= ticket["subtitle"];
        print(state);
        print(ticketTitle);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    Screen.setBrightness(0.5);
    
    _qrTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //before we click the back button check user config for crash control
        var ejectionSetting = await NXHelp().loadConfig("ejection", 1);
        //grab the user selected error settings
        print(ejectionSetting);
        //stick to the default
        if (ejectionSetting.length <= 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Nxfront()));
        } else if (ejectionSetting[0]["val"] == "crash") {
          print("crash");
          exit(0);
        } else if (ejectionSetting[0]["val"] == "fakeerror") {
          print("fake error");
          exit(0);
        } else if (ejectionSetting[0]["val"] == "launchapp") {
          LaunchReview.launch(androidAppId: "com.justride.nxwm");
          await AppLauncher.openApp(
            androidApplicationId: "com.justride.nxwm",
          );
        }

        //launch real app

        //crash app/close app

        //fake error message

        return;
      },
      child: speedConfig == null
          ? Container()
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
                            MaterialPageRoute(builder: (context) => Nxfront()),
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
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
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
                                              velocity: double.parse(
                                                  speedConfig['top'][0]['val']),
                                              textContent:
                                                  "$state $ticketTitle",
                                              isUpper: true,
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      height: 190,
                                      child: Image.asset(
                                        currentQR,
                                        width: 180,
                                        height: 190,
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
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
                                    height: state==States.warwickUni?5:10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 0),
                                    child: TicketColor(
                                      speed: double.parse(
                                          speedConfig['bottom'][0]['val']),
                                      ctx: context,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 0),
                                    child: Nxsig(
                                      isRounded: ticketTitle == "Group Daysaver"
                                          ? true
                                          : false,
                                      state: state,
                                      isBottomRounded: true,
                                      ticketType: ticketTitle,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      print("Show rewards");
                                    },
                                                                      child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20, top: 8),
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
                                              color:
                                                  Colors.white.withOpacity(0.7),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        for (var i = 0; i < 100; i++)
                                          Container(
                                            height: 1,
                                            width: 1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Color.fromRGBO(
                                                    103, 119, 138, 1)),
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
                                        onTap: () {
                                          ActionOverlay().display(context);
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.more_horiz,
                                                  color: Color.fromRGBO(
                                                      103, 119, 138, 1)),
                                              onPressed: () {},
                                            ),
                                            Text(
                                              "Actions",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      103, 119, 138, 1),
                                                  fontWeight: FontWeight.w800),
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
                                                builder: (context) =>
                                                    TicketDetail(
                                                      txid: widget.txid,
                                                    )),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 17.0),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )
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
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
