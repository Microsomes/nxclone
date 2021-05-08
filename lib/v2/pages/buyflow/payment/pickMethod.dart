import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/buyflow/components/allPaymentOptions.dart';
import 'package:BubbleGum/v2/pages/buyflow/payment/paymentFinal.dart';

class PickPaymentMethodAndConfirmItem extends StatelessWidget {
  final String selectedState;
  final selectedTicket;

  String priceOfTicket = "0.00";
  String tickettitle = "";

  PickPaymentMethodAndConfirmItem(
      {@required this.selectedState, @required this.selectedTicket}) {
 
 
    priceOfTicket = this.selectedTicket['price'];
    tickettitle =
        this.selectedTicket['state'] + " " + this.selectedTicket['tickettitle'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 241, 241, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: PreferredSize(
                preferredSize: Size.fromHeight(500),
                child: Image.asset("images/leftarrow.png", width: 4))),
        title: Center(
          child: Text(
            "Select payment method",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 9,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Color.fromRGBO(187, 157, 107, 1),
                ),
                Container(
                  height: 9,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Color.fromRGBO(169, 27, 26, 1),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(169, 27, 26, 1),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  "$tickettitle",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Text(""),
                ),
                Text(
                  "1x  £$priceOfTicket",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          Container(
            height: 36,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(123, 26, 17, 1),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(""),
                ),
                Text(
                  "£$priceOfTicket",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 14,
                )
              ],
            ),
          ),
          Container(
            height: 27,
            color: Color.fromRGBO(253, 237, 237, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    "Payment methods",
                    style: TextStyle(
                        color: Color.fromRGBO(75, 8, 8, 1),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                print("purcahse");
                print(selectedTicket);
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentFinal(
                            id: selectedTicket['id'],
                          )),
                );
              },
              child: AllPaymentOptions()),
        ],
      ),
    );
  }
}
