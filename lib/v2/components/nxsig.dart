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
      height: 130,
      width: MediaQuery.of(context).size.width*0.785,
      color: Color.fromRGBO(243, 199, 210, 1),
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
          )
        ],
      ),
    );
   
  }

}