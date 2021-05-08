import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/buyflow/payment/paymentConfirmed.dart';

class PaymentFinal extends StatefulWidget {
  final int id;

  PaymentFinal({@required this.id});

  @override
  State<StatefulWidget> createState() {
    return PaymentFinalState();
  }
}

class PaymentFinalState extends State<PaymentFinal> {
  String priceOfTicket = "0.00";
  String tickettitle = "l;";

  @override
  void initState() {
    super.initState();

    NXHelp().getTicketByIDV2(widget.id).then((value) {
      TicketModel m = value;
      setState(() {
        tickettitle=m.state+" "+ m.tickettitle;
        priceOfTicket= m.price;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            "Enter card information",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 9,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Color.fromRGBO(187, 157, 107, 1),
                  ),
                  Container(
                    height: 9,
                    width: MediaQuery.of(context).size.width * 0.3,
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
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Security Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.37,
                                  height: 38,
                                  alignment: Alignment.centerLeft,
                                  color: Color.fromRGBO(243, 244, 246, 1),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 10, bottom: 10)),
                                  )),
                              Container(
                                color: Color.fromRGBO(219, 220, 221, 1),
                                height: 5,
                                width: MediaQuery.of(context).size.width * 0.37,
                              )
                            ],
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.info_outline,
                        color: Color.fromRGBO(169, 27, 26, 0.7),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 35),
                    child: Text(
                      "Enter the email address below that you would like\nyour receipt sent to",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 26),
                    child: Text(
                      "Your email",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 38,
                                alignment: Alignment.centerLeft,
                                color: Color.fromRGBO(243, 244, 246, 1),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "",
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 10)),
                                ),
                              ),
                              Container(
                                color: Color.fromRGBO(219, 220, 221, 1),
                                height: 5,
                                width: MediaQuery.of(context).size.width * 0.9,
                              )
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 25),
                    child: Row(
                      children: <Widget>[
                        Text("This ticket purchase is subject to"),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "terms and conditions",
                          style: TextStyle(
                              color: Color.fromRGBO(169, 225, 244, 1)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    child: InkWell(
                      onTap: () {
                        //add ticket to your wallet and process it
                        //PaymentConfirmed
                        // Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => PaymentConfirmed()),
                        //       (Route<dynamic> route) => false,
                        //     );

                        // var ttitle = widget.selectedTicket['tickettitle'];
                        // var tstate = widget.selectedTicket['state'];
                        // var tprice = widget.selectedTicket['price'];

                        NXHelp().buyTicketv2(ticketID: widget.id, tag: "self_buy").then((value) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (ctx)=>PaymentConfirmed()
                          ));
                        });

                        // NXHelp()
                        //     .buyTicket(
                        //         tickettype: ttitle,
                        //         state: tstate,
                        //         price: tprice)
                        //     .then((value) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentConfirmed()),
                        //   );
                        // });
                        //calls method to buys ticket
                      },
                      child: Container(
                        width: 380,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(123, 26, 17, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(215, 216, 218, 1),
                                  offset: new Offset(0, 3))
                            ]),
                        child: Row(children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Accept and pay £$priceOfTicket",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                          SizedBox(
                            width: 4,
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
