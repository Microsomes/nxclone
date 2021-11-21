import 'package:bubble_gum/src/v3/models/ticketModel.dart';
import 'package:bubble_gum/src/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';

class PurchaseDetailModel extends StatefulWidget {
  final TicketWalletModel ticketWalletInfo;
  final TicketModel ticketDetail;

  PurchaseDetailModel(
      {@required this.ticketWalletInfo, @required this.ticketDetail});

  @override
  _PurchaseDetailModelState createState() => _PurchaseDetailModelState();
}

class _PurchaseDetailModelState extends State<PurchaseDetailModel> {
  String purchaseDate;

  String last4;

  @override
  void initState() {
    setState(() {
      purchaseDate = widget.ticketWalletInfo.getPurchaseDateHuman();
      last4 = widget.ticketWalletInfo.cardLast4;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        height: 140,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "PURCHASE",
              style: TextStyle(
                  color: Color.fromRGBO(110, 110, 110, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$purchaseDate",
                      style: TextStyle(
                          color: Color.fromRGBO(61, 61, 61, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Card ending in ****$last4",
                      style: TextStyle(
                          color: Color.fromRGBO(61, 61, 61, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                // Container(
                //   alignment:Alignment.center,
                //   height: 50,
                //   width: 90,
                //   decoration: BoxDecoration(

                //       borderRadius:
                //           BorderRadius.all(
                //               Radius.circular(1))),
                //   child: Padding(

                //     padding: EdgeInsets.only(top:20),

                //   child: Image.asset("images/v2/v2assets/visa.png",width: 90,)),
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 0.8,
              color: Color.fromRGBO(231, 231, 231, 1),
            ),
          ],
        ));
  }
}
