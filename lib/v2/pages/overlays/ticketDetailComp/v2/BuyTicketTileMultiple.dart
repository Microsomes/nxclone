import 'dart:async';

import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:google_fonts/google_fonts.dart';

import 'comp/multipleIndicator.dart';

class BuyTicketTypesMultiple extends StatefulWidget {
  final String selectedState;

  BuyTicketTypesMultiple({@required this.selectedState});

  @override
  State<StatefulWidget> createState() {
    return BuyTicketTypesState();
  }
}

class BuyTicketTypesState extends State<BuyTicketTypesMultiple> {
  List ticketTypes;

  NXHelp nxhelp;

  List<Map> inBasket;

  Timer one;

  @override
  void dispose() {
    one.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    inBasket = [];

    ticketTypes = [];

    nxhelp = NXHelp();

    nxhelp.getAllTickets(widget.selectedState).then((value) {
      ticketTypes = value;
      setState(() {});
    });

    one = Timer.periodic(Duration(seconds: 1), (timer) {
      if (basket != null) {
        double totalToSend = 0;
        basket.forEach((key, value) {
          int qty = value['count'];

          double price = value['price'];

          double totalLocal = price *= qty;

          print(totalLocal);

          totalToSend += totalLocal;
        });
        setState(() {
          totalPrice = totalToSend;
        });
      }
    });
  }

  double totalPrice = 0;

  Map basket = Map();

  // String totalFromBasket() {}

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
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 20),
                            margin: EdgeInsets.only(top: 20),
                            height: 89,
                            child: Center(
                              child: ListTile(
                                  trailing: MultipleIndicator(
                                    ticketid: ticketTypes[index]['id'],
                                    ticketPrice: ticketTypes[index]['price'],
                                    onTotal: (count, price, id) {
                                      print(count);
                                      print(price);

                                      if (basket[id] == null) {
                                        basket[id] = {
                                          "count": count,
                                          "price": double.parse(price),
                                          "totalP":
                                              (double.parse(price) * count)
                                        };
                                      } else {
                                        basket[id] = {
                                          "count": count,
                                          "price": double.parse(price),
                                          "totalP":
                                              (double.parse(price) * count)
                                                  .toStringAsFixed(2)
                                        };
                                      }

                                      // basket.forEach((key, value) {
                                      //     setState(() {
                                      //       totalPrice= value['totalP'];
                                      //     });
                                      // });

                                      // print(val);
                                      // setState(() {
                                      //   totalPrice+=val;
                                      // });
                                    },
                                  ),
                                  leading: IconButton(
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                  title:
                                      Text(ticketTypes[index]['tickettitle']),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          ticketTypes[index]['ticketsubtitle']),
                                      Text(
                                        "£" + ticketTypes[index]['price'],
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                          ));
                    }),
              )
            : CircularProgressIndicator(),
        totalPrice == 0
            ? Container()
            : Container(
                height: 110,
                color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Color.fromRGBO(243, 244, 246, 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Sub total £" + totalPrice.toStringAsFixed(2)),
                            SizedBox(width: 25)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(169, 27, 26, 1),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
      ],
    );
  }
}
