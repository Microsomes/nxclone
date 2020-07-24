import 'package:flutter/material.dart';
import 'package:nxclone/pages/journey/ticket.dart';
import 'dart:async';
import 'package:intl/intl.dart';
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer time) {
      setState(() {
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

      if (currentRange != 0.40) {
        setState(() {
          currentRange = 0.40;
        });
      } else {
        setState(() {
          currentRange = 0.01;
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

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
                Container(
                  width: MediaQuery.of(context).size.width / 3.82,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3.82,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.only()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3.82,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                ),
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
          ],
        ));
  }
}
