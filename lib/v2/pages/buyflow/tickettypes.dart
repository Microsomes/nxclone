import 'package:flutter/material.dart';

import 'components/ticketoption.dart';


class BuyTicketTypes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyTicketTypesState();
  }
}

class Ttype{
  static String singlejourney="Single Journey";
  static String singlejourney_cov="Coventry Single Journey";
  static String daySaver="Daysaver";
  static String daySaver_cov="Coventry Daysaver";
  static String daysaverafter930monfri="Daysaver after 9.30am (Mon-Fri)";
  static String daySaversatsun="Daysaver (Sat-Sun)";
  static String eveningSaverafter6="Evening Saver after 6pm";
  static String groupdaysaver="Group Daysaver";
  static String groupdaysaverafter6="Group Daysaver after 6pm";
}


class BuyTicketTypesState extends State<BuyTicketTypes>{


    List ticketTypes;

    

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ticketTypes=List();


      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":"West Midlands",
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });


      ticketTypes.add({
        "title":Ttype.daySaver,
        "subtitle":"All busses across our network",
        "price":"4.60",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"All busses across our network",
        "price":"3.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":"West Midlands",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":"West Midlands",
        "info":[
             "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });



      ////////conventry
      
      ticketTypes.add({
        "title":Ttype.singlejourney_cov,
        "subtitle":"Any bus acorss our network",
        "price":"2.20",
        "state":"Conventry",
        "info":[
          "Includes travel on all our busses in the Conventry & surrounding areas as far as north as Bedworth & Keresley and along a southern corridor to Kenilworth & Leamington Spa.",
          "The main places including in the Conventry area are:",
          "Conventry City Centre, Binley, Finham,",
          "Earlsdon, Canley, Longford, Bedworth,",
          "Meriden, Tile Hill, Hearsall Common,",
          "Leamington Spa & Kenilworth"
        ]
      });

      ticketTypes.add({
        "title":Ttype.daySaver_cov,
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

      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":"Conventry",
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":"Conventry",
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

       ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"Any busses across our network",
        "price":"3.00",
        "state":"Conventry",
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"Any busses across our network",
        "price":"6.00",
        "state":"Conventry",
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"Any busses across our network",
        "price":"4.00",
        "state":"Conventry",
        "info":[
              "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      //black country

      ticketTypes.add({
        "title":Ttype.singlejourney,
        "subtitle":"Any bus acorss our network",
        "price":"2.40",
        "state":"Black Country",
        "info":[
          "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

       ticketTypes.add({
        "title":Ttype.daySaver,
        "subtitle":"All busses across our network",
        "price":"4.60",
        "state":"Black Country",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.daysaverafter930monfri,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":"Black Country",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      ticketTypes.add({
        "title":Ttype.daySaversatsun,
        "subtitle":"All busses across our network",
        "price":"4.00",
        "state":"Black Country",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.eveningSaverafter6,
        "subtitle":"All busses across our network",
        "price":"3.00",
        "state":"Black Country",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaver,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":"Black Country",
        "info":[
            "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });
      ticketTypes.add({
        "title":Ttype.groupdaysaverafter6,
        "subtitle":"All busses across our network",
        "price":"7.00",
        "state":"Black Country",
        "info":[
             "Includes travel on all our buses across the West Midlands, Black Country & Coventry."
        ]
      });

      //Sandwell & Dudley low fare zone




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