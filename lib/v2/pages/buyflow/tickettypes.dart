import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/buyflow/payment/pickMethod.dart';

import 'components/ticketoption.dart';

class BuyTicketTypes extends StatefulWidget {
  final String selectedState;

  BuyTicketTypes({@required this.selectedState});

  @override
  State<StatefulWidget> createState() {
    return BuyTicketTypesState();
  }
}

class BuyTicketTypesState extends State<BuyTicketTypes> {
  List ticketTypes;

  NXHelp nxhelp;

  @override
  void initState() {
    super.initState();

    ticketTypes = List();

    nxhelp = NXHelp();

    nxhelp.getAllTickets(widget.selectedState).then((value) {

      ticketTypes = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ticketTypes.length >= 1
            ? Expanded(
                child: ListView.builder(
                    itemCount: ticketTypes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
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
                          subtitle: ticketTypes[index]['ticketsubtitle'],
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
