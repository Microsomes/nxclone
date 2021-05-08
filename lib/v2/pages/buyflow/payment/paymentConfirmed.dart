import 'package:BubbleGum/pages/ticketwalletv2.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/pages/ticketwallet.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentConfirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nxfront()),
        );

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Nxfront()));
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Center(
            child: Text(
              "Confirmation",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Transaction",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Successful",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Icon(
                    Icons.check,
                    size: 100,
                    color: Color.fromRGBO(81, 164, 27, 1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please activate your ticket just \nbefore boarding",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushAndRemoveUntil(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Ticketwallet()),
                      //     );
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TicketWalletV2()),
                          (Route<dynamic> route) => true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(123, 26, 17, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(215, 216, 218, 1),
                                  offset: new Offset(0, 3))
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Go to Ticket Wallet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              )
                            ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      const url = "https://www.nxrewards.com/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        //throw 'Could not launch $url';
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 380,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(65, 98, 53, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(215, 216, 218, 1),
                                  offset: new Offset(0, 3))
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "NX Rewards Cashback",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
