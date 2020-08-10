import 'package:flutter/material.dart';


class BarV2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
            elevation: 0.0,
            title: Text(
              "Black Pie",
              style: TextStyle(
                  color: Color.fromRGBO(255,255,255,1), fontSize: 22),
            ),
            backgroundColor:Colors.black,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(29)),
                  width: 120,
                  height: 10,
                  child: Center(
                    child: Text(
                      "By Chris",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          );
  }
}