import 'package:flutter/material.dart';

class Nxsig extends StatefulWidget {
  final bool isRounded;

  final bool isBottomRounded;

  final String state;
  
  final String company;

  Nxsig({@required this.isRounded, @required this.state, this.isBottomRounded=false,this.company="national express"});

  @override
  State<StatefulWidget> createState() {
    return NxsigState();
  }
}

class NxsigState extends State<Nxsig> {
  @override
  Widget build(BuildContext context) {

    var state = widget.state;

    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(248, 233, 226, 1),
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(widget.isBottomRounded == true ? 10 : 0),
              bottomRight:
                  Radius.circular(widget.isBottomRounded == true ? 10 : 0))),
      height: 140,
      width: MediaQuery.of(context).size.width * 0.785,
      child: Column(
        children: <Widget>[
          Container(
            height: 18,
            decoration: BoxDecoration(
                color: Color.fromRGBO(162,31,41,1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(widget.isRounded == true ? 10 : 0),
                  topLeft: Radius.circular(widget.isRounded == true ? 10 : 0),
                )),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  "$state",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "mTicket",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.company.split(" ")[0],
                      style: TextStyle(
                          color: Color.fromRGBO(205, 192, 201, 1),
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.company.split(" ")[1],
                      style: TextStyle(
                          color: Color.fromRGBO(205, 192, 201, 1),
                          height: 0.55,
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    "$state",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(239, 193, 193, 1),
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
