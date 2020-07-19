import 'package:flutter/material.dart';
import 'package:nxclone/v2/components/fancyOptions.dart';

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

     List ticketOptions=List();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticketOptions.add({"title":"Daysaver","icon":Icons.settings,"asset":"images/landing2.png"});
    ticketOptions.add({"title":"Single","icon":Icons.settings,"asset":"images/landing1.png"});
    ticketOptions.add({"title":"Daysaver (Sat-Sun)","icon":Icons.settings,"asset":"images/landing1.png"});
    ticketOptions.add({"title":"Evening Saver after 6pm","icon":Icons.settings,"asset":"images/landing1.png"});
    ticketOptions.add({"title":"Group Day Saver","icon":Icons.settings,"asset":"images/landing1.png"});
    ticketOptions.add({"title":"Group Daysaver after 6pm","icon":Icons.settings,"asset":"images/landing1.png"});
 
  }

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
        ),),

        Expanded(
          child: Center(child: 
          ListView.builder(
            itemCount: ticketOptions.length,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: FancyOptions(
                title: ticketOptions[index]['title'],
                isSelected: false,
                assetRoute: "images/home1.png",
                clicked: (){},
              ),
            );
          })
          ),
        )

            
        ],
      )
    );
  }
}