import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:marquee/marquee.dart';
import 'package:intl/intl.dart';
import 'package:nxclone/main.dart';
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings.dart';
import './ticketInfo.dart';
import 'package:screen/screen.dart';

import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class Ticket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TicketState();
  }
}

class TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stpage();
  }
}

class Stpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Stpagestate();
  }
}

class Stpagestate extends State<Stpage> {
  double currentRange = 0.1;

  static DateTime now;
  static DateTime now1;
  String formattedDate = "contacting server for time";

  bool moveBackward = false;

  bool isQROpen = false;
  //determines if qr is open

  Timer _timer;

  Timer _timer_for_opacity;

  Timer _timer_for_opacity_2;

  int elaspedTime = 0;

  Stpagestate() {
    now1 = DateTime.now();
  }




  Color col1 = Color.fromRGBO(112, 53, 195, 1);
  Color col2 = Color.fromRGBO(156, 52, 199, 1);
  Color col3 = Color.fromRGBO(242, 241, 65, 1);

  Color op1 = Color.fromRGBO(213, 0, 0, 1);
  Color op2 = Color.fromRGBO(197, 17, 98, 1);
  Color op3 = Color.fromRGBO(170, 0, 255, 1);
  Color op4 = Color.fromRGBO(98, 0, 234, 1);
  Color op5 = Color.fromRGBO(48, 79, 254, 1);

  Color op6 = Color.fromRGBO(0, 184, 212, 1);
  Color op7 = Color.fromRGBO(0, 191, 165, 1);
  Color op8 = Color.fromRGBO(0, 200, 83, 1);
  Color op9 = Color.fromRGBO(100, 231, 23, 1);
  Color op10 = Color.fromRGBO(174, 234, 0, 1);

  Color op11 = Color.fromRGBO(255, 214, 0, 1);
  Color op12 = Color.fromRGBO(255, 111, 0, 1);
  Color op13 = Color.fromRGBO(191, 54, 12, 1);
  Color op14 = Color.fromRGBO(62, 39, 35, 1);
  Color op15 = Color.fromRGBO(33, 33, 33, 1);


  double opacity1=1;

  void _showDialog(int index) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Change Color"),
          content: Column(
            children: <Widget>[
              Text("Change Color of #$index"),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op1;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op1;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op1;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op1,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op2;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op2;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op2;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op2,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op3;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op3;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op3;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op3,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op4;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op4;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op4;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op4,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op5;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op5;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op5;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op5,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op6;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op6;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op6;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op6,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op7;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op7;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op7;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op7,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op8;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op8;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op8;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op8,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op9;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op9;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op9;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op9,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op10;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op10;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op10;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op10,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op11;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op11;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op11;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op11,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op12;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op12;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op12;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op13;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op13;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op13;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op13,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op14;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op14;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op14;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op14,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (index) {
                          case 1:
                            setState(() {
                              col1 = op15;
                            });
                            break;
                          case 2:
                            setState(() {
                              col2 = op15;
                            });
                            break;
                          case 3:
                            setState(() {
                              col3 = op15;
                            });
                            break;
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: op15,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _timer_for_opacity.cancel();
    _timer_for_opacity_2.cancel();

    Screen.setBrightness(0.1).then((onValue) {
      print(onValue);
    });
  }


  double nextOpacity=2;
  //determines when next opacity shold appen
  double nextOp1Interval=2;
  //determines the frequency of the change

  bool justStartedOpacity=true;


  double opacityBlock1=1;


  bool isUp=true;


  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //make screen brighter

    Screen.setBrightness(1).then((onValue) {
      print(onValue);
    });

    _timer_for_opacity= Timer.periodic(Duration(milliseconds: 500), (Timer time){

      isUp= !isUp;
      print(isUp);

      if(isUp){
        setState(() {
          opacity1=1;
        });
      }else{
        setState(() {
          opacity1=0.4;
        });
      }

   

    });

  


    _timer = Timer.periodic(Duration(seconds: 2), (Timer time) {
      //   now1 = DateTime.now();

      setState(() {
        now = DateTime.now();
        formattedDate = DateFormat.Hms().format(now);
      });
      elaspedTime++;

      print(elaspedTime);

      if (currentRange != 0.58) {
        setState(() {
          currentRange = 0.58;
       
        });
      } else {
        setState(() {
          currentRange = 0.05;
          
        });
      }
    });
  }


  double heightBlock=0.125;

    Future setHomePage(String homePage) async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.setString("defaultPage",homePage);
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Text(
            "West Midlands Daysaver",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: sizeW,
          color: Color.fromRGBO(240, 240, 240, 1),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 2,
                ),
                isQROpen == false
                    ? Container(
                        height: MediaQuery.of(context).size.height*0.26,
                         width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom:14,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isQROpen = true;
                                  });
                                },
                                child: Container(
                                  width: 84,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(167, 27, 26, 1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                215, 216, 218, 1),
                                            offset: new Offset(0, 3))
                                      ]),
                                  child: ClipRRect(
                                      child: Center(
                                          child: Image.asset(
                                              "images/whitedown.png",
                                              width: 30))),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.18,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              print("change first color");
                                              _showDialog(1);
                                            },
                                            child: AnimatedOpacity(
                                              opacity: opacity1,
                                              duration: Duration(milliseconds: 800),
                                                                                          child: Container(
                                                height: MediaQuery.of(context).size.height*heightBlock,
                                                width: MediaQuery.of(context).size.width/3*0.9,
                                                decoration: BoxDecoration(
                                                    color: col1,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5))),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _showDialog(2);
                                            },
                                            child: AnimatedOpacity(
                                              opacity: opacity1,
                                              duration: Duration(milliseconds: 700),
                                                                                          child: Container(
                                                height: MediaQuery.of(context).size.height*heightBlock,
                                                width: MediaQuery.of(context).size.width/3*0.9,
                                                decoration: BoxDecoration(
                                                    color: col2,
                                                    borderRadius:
                                                        BorderRadius.only()),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print("change third color");
                                              _showDialog(3);
                                            },
                                            child: AnimatedOpacity(
                                              opacity: opacity1,
                                              duration: const Duration(milliseconds:500),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*heightBlock,
                                                width: MediaQuery.of(context).size.width/3*0.9,
                                                child: Center(child: Text(""),),
                                                decoration: BoxDecoration(
                                                    color: col3,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5))),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      AnimatedPositioned(
                                        duration: Duration(milliseconds: 2000),
                                        left: sizeW * currentRange,
                                        child: Text(
                                          formattedDate,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 33,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Color.fromRGBO(
                                                      19, 8, 23, 1),
                                                  offset: Offset(2, 5),
                                                ),
                                                Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.black,
                                                  offset: Offset(-2, 0),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Tap to reveal barcode",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 285,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 12,
                              child: InkWell(
                                onTap: () {
                                  print("open the other one");
                                  setState(() {
                                    isQROpen = false;
                                  });
                                },
                                child: Container(
                                    width: 83,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(167, 27, 26, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  215, 216, 218, 1),
                                              offset: new Offset(0, 3))
                                        ]),
                                    child: ClipRRect(
                                      child: Center(
                                          child: Transform.rotate(
                                              angle: -3.16,
                                              child: Image.asset(
                                                  "images/whitedown.png",
                                                  width: 30))),
                                    )),
                              ),
                            ),
                            Container(
                              height: 226,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: QrImage(
                                              data: "lmklmklmlmklmklmklmklmklmklmklmklmklmklmklmkls",
                                              version:3,
                                              size: 100,
                                              gapless: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Tap to view color bar",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                // Container(
                //   height: 44,
                //   width: sizeW * 0.90,
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //           color: Color.fromRGBO(204, 51, 51, 1),
                //           offset: new Offset(0, 3))
                //     ],
                //     color: Color.fromRGBO(237, 32, 62, 1),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Center(
                //     child: Text(
                //       "Ticket activated at " + DateFormat.Hm().format(now1),
                //       style: TextStyle(
                //           color: Colors.white, fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "West Midlands Daysaver",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/info.png", width: 27),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Any bus across our network",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                  height: 70,
                  width: sizeW * 0.9,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset("images/nxsig.png", width: sizeW * 0.9),
                ),
                Container(
                  height: 80,
                  width: sizeW * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(215, 216, 218, 1),
                          offset: new Offset(0, 3))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(64, 104, 50, 1),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: []),
                      child: Center(
                        child: Text(
                          "NX Rewards Cashback",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 80,
                    width: sizeW * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: sizeW / 2 * 0.8,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(169, 27, 26, 1),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(123, 19, 21, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentRange = 0.60;

                                      
                                      opacity1=opacity1-=0.3;

                                          setHomePage("home page").then((oni){

                                            //restart app

                                                    Fluttertoast.showToast(
                      msg: "Restart app to load to home page",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.white,
                      fontSize: 16.0);

                                          });
                                      


                                      
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "Actions",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: sizeW / 2 * 0.8,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(169, 27, 26, 1),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(123, 19, 21, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: InkWell(
                                  onTap: () {
                                    print("ticket info");

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TicketInfoPage()));

                                    setState(() {
                                      currentRange = 0.1;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "Ticket Info",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                          ],
                        ))),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
