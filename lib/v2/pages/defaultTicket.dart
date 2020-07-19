import 'package:flutter/material.dart';

import '../../components/daysaveractive.dart';
import '../main/bar.dart';


class DefaultTicket extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DefaultTicketState();
  }

}

class DefaultTicketState extends State<DefaultTicket>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: BarV2(),
      ),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
            color: Color.fromRGBO(123, 26, 17, 1),
          height: 160,
          child: ticketTwo(),
        ),
        SizedBox(height: 20,),
        Text("Customise Ticket",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),)

        
      
        ],
      )
    );
  }
}