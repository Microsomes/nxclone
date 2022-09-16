import 'package:BubbleGum/v2/pages/buyflow/components/ticketoption.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/buyflow/payment/pickMethod.dart';

 
class BuyTicketTypesSingle extends StatefulWidget {
  final String selectedState;

  BuyTicketTypesSingle({@required this.selectedState});

  @override
  State<StatefulWidget> createState() {
    return BuyTicketTypesState();
  }
}

class BuyTicketTypesState extends State<BuyTicketTypesSingle> {
  List ticketTypes;

  NXHelp nxhelp;

  @override
  void initState() {
    super.initState();

    ticketTypes = [];

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
                        onTap: () {},
                        child: TicketOption(
                          selectedState: widget.selectedState,
                          selectedTicket: ticketTypes[index],
                          ticketBuyProcess: (selectedState, selectedTicket) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PickPaymentMethodAndConfirmItem(
                                          selectedState: selectedState,
                                          selectedTicket: selectedTicket,
                                        )));
                          },
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
