import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/overlays/termsandconditions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ticketDetailComp/purchaseDetail.dart';
import 'ticketDetailComp/ticketiddets.dart';
import 'ticketDetailComp/tripDetail.dart';
import 'ticketDetailComp/validUntil.dart';

class TicketDetail extends StatefulWidget {
  final int txid;

  final bool isDaysLeft;

  TicketDetail({@required this.txid, this.isDaysLeft = false});

  @override
  State<StatefulWidget> createState() {
    return TicketDetailState();
  }
}

class TicketDetailState extends State<TicketDetail> {
  bool currentTicket = true;

  List<Widget> allInfoPanels;

  String ticketStatusIn = "";

  TicketModel ticketModel;
  TicketWalletModel ticketWalletModel;

  @override
  void initState() {
    allInfoPanels = [];

    //load the ticket information
    NXHelp().getTicketWalletInfoByID(id: widget.txid).then((value) {
      List<TicketWalletModel> al = value;
      al[0].getTicketData().then((value) async {
        TicketModel md = value;
        setState(() {
          ticketModel = md;
          ticketWalletModel = al[0];
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Text("Close",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: ListView(
                        children: <Widget>[
                          ticketModel == null
                              ? Container()
                              : ValidUntilComp(
                                  ticketDetail: ticketModel,
                                  ticketWalletInfo: ticketWalletModel,
                                ),
                          ticketModel == null
                              ? Container()
                              : TripDetailModel(
                                  ticketDetail: ticketModel,
                                  ticketWalletInfo: ticketWalletModel),
                          ticketModel == null
                              ? Container()
                              : PurchaseDetailModel(
                                  ticketDetail: ticketModel,
                                  ticketWalletInfo: ticketWalletModel),
                          ticketModel == null
                              ? Container()
                              : TicketDetailIDModel(
                                  ticketDetail: ticketModel,
                                  ticketWalletInfo: ticketWalletModel),
                        ],
                      )),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color.fromRGBO(5, 121, 160, 1),
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Color.fromRGBO(5, 121, 160, 1),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TermsConditions()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 17.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.sort,
                                      color: Color.fromRGBO(5, 121, 160, 1),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "Terms",
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 121, 160, 1),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ))));
  }
}
