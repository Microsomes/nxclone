import 'package:flutter/material.dart';

class Nxsig extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NxsigState();
  }

}

class NxsigState extends State<Nxsig>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width*0.785,
      color: Color.fromRGBO(248, 233, 226, 1),
      child: Column(
        children: <Widget>[
          Container(
            height: 18,
            color: Color.fromRGBO(140, 36, 40, 1),
            child: Row(
              children: <Widget>[
                SizedBox(width: 15,),
                Text("West Midlands",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
                Expanded(child: Container(),),
                Text("mTicket",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(width: 10,)
              ],
            ),
          ),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("national",
                  style: TextStyle(color: Color.fromRGBO(205, 192, 201, 1),
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w500),),
                  Text("express",style: TextStyle(color: Color.fromRGBO(205, 192, 201, 1),
                  height: 0.55,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w500),),
                ],

              ),
              SizedBox(width: 5,),
              Text("West Midlands",
              style: TextStyle(
                color: Color.fromRGBO(239, 193, 193, 1),
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),)

            ],

          ),)
        ],
      ),
    );
   
  }

}