import 'package:flutter/material.dart';
import 'package:nxclone/pages/journey/ticket.dart';

class TicketColor extends StatefulWidget{

  BuildContext ctx;


  TicketColor({@required this.ctx});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TicketColorState();
  }
}

class TicketColorState extends State<TicketColor>{




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 70,
      width:MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/3.82,
            height: 55,
            decoration: BoxDecoration(
                  color: Colors.pink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10)
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/3.82,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(

              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/3.82,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10)
              )
            ),
          ),

        ],
      ),
       
    );
  }

}