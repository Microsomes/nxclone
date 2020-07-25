import 'package:flutter/material.dart';
import 'package:nxclone/pages/journey/ticket.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:nxclone/v2/helper/NxHelp.dart';
import 'package:nxclone/v2/pages/overlays/colorSelectorOver.dart';

class TicketColor extends StatefulWidget {
  final BuildContext ctx;

  TicketColor({@required this.ctx});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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

  Timer _timer_for_opacity;

  Timer _timer_for_opacity_2;

  bool isUp = true;
  double opacity1 = 1;

  String dy;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    NXHelp().loadConfig("opt1col", 1).then((opt1colconfig) {
      if(opt1colconfig.length==0){
      }else{
        print(opt1colconfig);
        var curVal=opt1colconfig[0]['val'];
        String valueString = curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt1=otherColor;
        setState(() {
        });
      }
    });
     NXHelp().loadConfig("opt2col", 1).then((opt1colconfig) {
      if(opt1colconfig.length==0){
      }else{
        print(opt1colconfig);
        var curVal=opt1colconfig[0]['val'];
        String valueString = curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt2=otherColor;
        setState(() {
        });
      }
    });
     NXHelp().loadConfig("opt3col", 1).then((opt1colconfig) {
      if(opt1colconfig.length==0){
      }else{
        print(opt1colconfig);
        var curVal=opt1colconfig[0]['val'];
        String valueString = curVal.split('(0x')[1].split(')')[0]; // kind of hacky..
        int value = int.parse(valueString, radix: 16);
        Color otherColor = new Color(value);
        opt3=otherColor;
        setState(() {
        });
      }
    });

    final df = new DateFormat('dd/MM/yyyy');
    var myvalue = DateTime.now();
    dy = df.format(myvalue);

    Timer.periodic(Duration(seconds: 1), (Timer time) {
      setState(() {
        dy = df.format(myvalue);

        now = DateTime.now();
        formattedDate = DateFormat.Hms().format(now);
      });
    });

    _timer = Timer.periodic(Duration(seconds: 2), (Timer time) {
      //   now1 = DateTime.now();

      setState(() {
        now = DateTime.now();
        formattedDate = DateFormat.Hms().format(now);
      });
      elaspedTime++;

      print(elaspedTime);

      if (currentRange != 0.20) {
        setState(() {
          currentRange = 0.20;
        });
      } else {
        setState(() {
          currentRange = 0.05;
        });
      }
    });

    _timer_for_opacity =
        Timer.periodic(Duration(milliseconds: 500), (Timer time) {
      isUp = !isUp;
      print(isUp);
      if (isUp) {
        setState(() {
          opacity1 = 1;
        });
      } else {
        setState(() {
          opacity1 = 0.4;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _timer_for_opacity.cancel();
    _timer_for_opacity_2.cancel();
  }

  void changeCol(Color col, index) async {
    switch (index) {
      case 1:
        setState(() {
          opt1 = col;
        });
        var cid = await NXHelp().saveConfig("opt1col", col.toString());
        print("color saved $cid");

        break;
      case 2:
        setState(() {
          opt2 = col;
        });
        var cid = await NXHelp().saveConfig("opt2col", col.toString());
        print("color saved $cid");
        break;
      case 3:
        setState(() {
          opt3 = col;
        });
        var cid = await NXHelp().saveConfig("opt3col", col.toString());
        print("color saved $cid");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

    var df = dy;

    // TODO: implement build
    return Container(
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    ColorSelectOver(toSend: changeCol, index: 1)
                        .ColorOverlay(context);
                  },
                  child: AnimatedOpacity(
                    opacity: opacity1,
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.82,
                      height: 55,
                      decoration: BoxDecoration(
                          color: opt1,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ColorSelectOver(toSend: changeCol, index: 2)
                        .ColorOverlay(context);
                  },
                  child: AnimatedOpacity(
                    opacity: opacity1,
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.82,
                      height: 55,
                      decoration: BoxDecoration(
                          color: opt2, borderRadius: BorderRadius.only()),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ColorSelectOver(toSend: changeCol, index: 3)
                        .ColorOverlay(context);
                  },
                  child: AnimatedOpacity(
                    opacity: opacity1,
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.82,
                      height: 55,
                      decoration: BoxDecoration(
                          color: opt3,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 2000),
              left: sizeW * currentRange,
              child: IgnorePointer(
                ignoring: true,
                child: Text(
                  "$formattedDate $df",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Color.fromRGBO(19, 8, 23, 1),
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
            ),
          ],
        ));
  }
}
