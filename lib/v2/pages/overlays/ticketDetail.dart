import 'package:BubbleGum/2022/2022helper.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/overlays/termsandconditions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/ticketColor.dart';
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

  var expiresIn = null;
  var expiredInHours = null;
  var expiredInMinutes = null;
  var expiredInDate = null;

  var activatedDate = null;

  var ticketDetail = null;

  var purchaseDate = null;
  var purchaseTime = null;

  var ticketID = null;

  @override
  void initState() {
    allInfoPanels = [];

    //get 10 random digits

    NXGetTicketDetails(widget.txid).then((value) {

      setState(() {
        ticketDetail = value;
      });


      if (value['isActive'] == 1) {
        //its active so see how many days left
        NXCalculateWhenActiveTicketExpire(widget.txid).then((value) {
          setState(() {
            expiresIn = value[0];
            expiredInHours = value[1];
            expiredInMinutes = value[2];
            expiredInDate = value[3];
            activatedDate = value[4];
            purchaseDate = value[5];
            purchaseTime = value[6];
          });
        });
      }
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
                    child:
                        Text("Close", style: GoogleFonts.roboto(fontSize: 15)),
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
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                          
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "VALID UNTIL",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text("$expiredInDate at 00:00",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  ),
                                  SizedBox(height: 4,),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Color.fromRGBO(163, 30, 28, 1),
                                        ),
                                        height: 20,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 10),
                                          child: Text(
                                            "$expiredInHours hours $expiredInMinutes MINUTES LEFT",
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                              Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ACTIVATED",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text("$activatedDate at 00:00",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  ),
                                  SizedBox(height: 4,),
                                 
                                ],
                              ),
                            ),
                            Divider(),
                             Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TRIP",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ticketDetail !=null ?Text(ticketDetail['ticketName'],
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  ):Container(),
                                  SizedBox(height: 4,),
                                 
                                ],
                              ),
                            ),
                            Divider(),
                             Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "PURCHASE",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("$purchaseDate at $purchaseTime"),
                                  SizedBox(height: 4,),
                                  Row(children: [
                                    Text("Card ending in ****7292"),
                                    Expanded(child: Container(),),
                                    Image.asset("images/v2/visa.png",width: 40,),
                                    SizedBox(width: 20,),

                                  ],)
                                 
                                ],
                              ),
                            ),
                            Divider(),
                             Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TICKET ID",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                 ticketDetail != null ? Text("AT"+ticketDetail['id'].toString()+"CFUEN6N",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  ):Container(),
                                  SizedBox(height: 4,),
                                 
                                ],
                              ),
                            ),
                            
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
                        ),
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
