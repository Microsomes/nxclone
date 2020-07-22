import 'package:flutter/material.dart';

import 'components/ticketoption.dart';


class BuyTicketTypes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyTicketTypesState();
  }
}

class BuyTicketTypesState extends State<BuyTicketTypes>{


    List ticketTypes;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ticketTypes=List();


      ticketTypes.add({
        "title":"Single Journey",
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":"West Midlands",
        "info":[
          "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });


      ticketTypes.add({
        "title":"DaySaver",
        "subtitle":"Any busses across our network",
        "price":"4.60",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":"DaySaver after 9.30am (Mon-Fri)",
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":"Daysaver (Sat-Sun)",
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":"Evening Saver after 6pm",
        "subtitle":"Any busses across our network",
        "price":"3.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":"Group Daysaver",
        "subtitle":"Any busses across our network",
        "price":"7.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":"Group Daysaver after 6pm",
        "subtitle":"Any busses across our network",
        "price":"7.00",
        "state":"West Midlands",
        "info":[
             "Includes travel on all our busss acorss the West Midlands, Black Country & Coventry."
        ]
      });



      ////////conventry
      
      ticketTypes.add({
        "title":"Conventry Single Journey",
        "subtitle":"Any bus acorss our network",
        "price":"2.20",
        "state":"Conventry",
        "info":[
          "Includes travel on all our busss in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
          "The main places including in the Conventry area are:",
          "Conventry City Centre, Binley, Finham,",
          "Earlsdon, Canley, Longford, Bedworth,",
          "Meriden, Tile Hill, Hearsall Common,",
          "Leamington Spa & Kenilworth"
        ]
      });

      ticketTypes.add({
        "title":"Conventry Single Journey",
        "subtitle":"All busses in the Conventry area",
        "price":"4.00",
        "state":"Conventry",
        "info":[
          "Includes travel on all our busss in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
          "The main places including in the Conventry area are:",
          "Conventry City Centre, Binley, Finham,",
          "Earlsdon, Canley, Longford, Bedworth,",
          "Meriden, Tile Hill, Hearsall Common,",
          "Leamington Spa & Kenilworth"
        ]
      });




  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[

        TicketOption(
          title: "Single Journey",
          subtitle: "Any bus across our network",
          price: "£2.40",
        )

      ],
    );
  }

}