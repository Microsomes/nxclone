import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/overlays/colorSelectorOver.dart';

class TicketColor extends StatefulWidget {
  final BuildContext ctx;
  final double speed;
  TicketColor({@required this.ctx, this.speed = 500});

  @override
  State<StatefulWidget> createState() {
    return TicketColorState();
  }
}

class TicketColorState extends State<TicketColor> {
  double currentRange = 0.1;
  String formattedDate = "contacting server for time";
  static DateTime now;
  int elaspedTime = 0;
  Timer _timer;
  Color opt1 = Colors.pink;
  Color opt2 = Colors.red;
  Color opt3 = Colors.green;
  Timer timerForOpacity;
  bool isUp = true;
  double opacity1 = 1;
  String dy;
  @override
  void initState() {
    super.initState();

    NXHelp().loadConfig("opt1col", 1).then((opt1colconfig) {
      if (opt1colconfig.length == 0) {
      } else {
        var curVal = opt1colconfig[0]['val'];
        String valueString =
            curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt1 = otherColor;
        if (this.mounted) {
          setState(() {});
        }
      }
    });
    NXHelp().loadConfig("opt2col", 1).then((opt1colconfig) {
      if (opt1colconfig.length == 0) {
      } else {
        var curVal = opt1colconfig[0]['val'];
        String valueString =
            curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt2 = otherColor;
        if (this.mounted) {
          setState(() {});
        }
      }
    });
    NXHelp().loadConfig("opt3col", 1).then((opt1colconfig) {
      if (opt1colconfig.length == 0) {
      } else {
        var curVal = opt1colconfig[0]['val'];
        String valueString =
            curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt3 = otherColor;
        if (this.mounted) {
          setState(() {});
        }
      }
    });

    final df = new DateFormat('dd/MM/yyyy');
    var myvalue = DateTime.now();
    dy = df.format(myvalue);

    Timer.periodic(Duration(seconds: 1), (Timer time) {
      if (this.mounted) {
        setState(() {
          dy = df.format(myvalue);

          now = DateTime.now();
          formattedDate = DateFormat.Hms().format(now);
        });
      }
    });

    _timer = Timer.periodic(Duration(milliseconds: 1000), (Timer time) {
      //   now1 = DateTime.now();

      if (this.mounted) {
        setState(() {
          now = DateTime.now();
          formattedDate = DateFormat.Hms().format(now);
        });
      }
      elaspedTime++;

      if (currentRange != 0.50) {
        if (this.mounted) {
          setState(() {
            currentRange = 0.50;
          });
        }
      } else {
        if (this.mounted) {
          setState(() {
            currentRange = 0.05;
          });
        }
      }
    });

    timerForOpacity = Timer.periodic(Duration(milliseconds: 300), (Timer time) {
      isUp = !isUp;
      if (isUp) {
        if (this.mounted) {
          setState(() {
            opacity1 = 1;
          });
        }
      } else {
        if (this.mounted) {
          setState(() {
            opacity1 = 0.4;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    timerForOpacity.cancel();
  }

  void changeCol(Color col, index) async {
    switch (index) {
      case 1:
        if (this.mounted) {
          setState(() {
            opt1 = col;
          });
        }
       // var cid = await NXHelp().saveConfig("opt1col", col.toString());

        break;
      case 2:
        if (this.mounted) {
          setState(() {
            opt2 = col;
          });
        }
       // var cid = await NXHelp().saveConfig("opt2col", col.toString());
        break;
      case 3:
        if (this.mounted) {
          setState(() {
            opt3 = col;
          });
        }
       // var cid = await NXHelp().saveConfig("opt3col", col.toString());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    var df = dy;

    //var sizemik=3.62;

    //var sizemik = (MediaQuery.of(context).size.width * 0.01) + 0.1;

    return Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                                  child: InkWell(
                                    onDoubleTap: (){
                                       ColorSelectOver(toSend: changeCol, index: 1)
                          .colorOverlay(context);
                                    },
                    onTap: () {
                      // ColorSelectOver(toSend: changeCol, index: 1)
                      //     .colorOverlay(context);
                    },
                    child: AnimatedOpacity(
                      opacity: opacity1,
                      duration: Duration(milliseconds: 800),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            color: opt1,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(10))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                                  child: InkWell(
                    onDoubleTap: () {
                      ColorSelectOver(toSend: changeCol, index: 2)
                          .colorOverlay(context);
                    },
                    child: AnimatedOpacity(
                      opacity: opacity1,
                      duration: Duration(milliseconds: 800),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            color: opt2, borderRadius: BorderRadius.only()),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                                  child: InkWell(
                    onDoubleTap: () {
                      ColorSelectOver(toSend: changeCol, index: 3)
                          .colorOverlay(context);
                    },
                    child: AnimatedOpacity(
                      opacity: opacity1,
                      duration: Duration(milliseconds: 800),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            color: opt3,
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(10))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.speed.toInt()+300),
              left: sizeW * currentRange,
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "$formattedDate",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Color.fromRGBO(19, 8, 23, 1),
                                offset: Offset(0, 4),
                              ),
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(-2, 0),
                              ),
                            ]),
                      ),
                      SizedBox(height:3),
                      Text(
                        "$df",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Color.fromRGBO(19, 8, 23, 1),
                                offset: Offset(0, 4),
                              ),
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(-2, 0),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ));
  }
}
