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