import 'package:flutter/material.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/pages/buyflow/payment/pickMethod.dart';

import 'components/ticketoption.dart';

class BuyTicketTypes extends StatefulWidget {
  final String selectedState;

  BuyTicketTypes({@required this.selectedState});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyTicketTypesState();
  }
}

class BuyTicketTypesState extends State<BuyTicketTypes> {
  List ticketTypes;

  NXHelp nxhelp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ticketTypes = List();

    nxhelp = NXHelp();

    nxhelp.getAllTickets(widget.selectedState).then((value) {
      print(value);

      ticketTypes = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ticketTypes.length >= 1
            ? Expanded(
                child: ListView.builder(
                    itemCount: ticketTypes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("open confirm");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PickPaymentMethodAndConfirmItem(
                                        selectedState: widget.selectedState,
                                        selectedTicket: ticketTypes[index],
                                      )));
                        },
                        child: TicketOption(
                          title: ticketTypes[index]['tickettitle'],
                          subtitle: "Any bus across our network",
                          price: "£" + ticketTypes[index]['price'].toString(),
                        ),
                      );
                    }),
              )
            : CircularProgressIndicator()
      ],
    );
  }
}
