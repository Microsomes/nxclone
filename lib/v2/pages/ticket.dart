import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/components/nxsig.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketPreActivate.dart';
import 'package:BubbleGum/v2/components/movingText.dart';
import 'package:BubbleGum/v2/pages/overlays/ticketDetail.dart';
import 'package:BubbleGum/v2/pages/overlays/actionsOverlay.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../2022/2022helper.dart';

class Ticket2 extends StatefulWidget {
  final int txdbid;

  Ticket2({@required this.txdbid});

  @override
  State<StatefulWidget> createState() {
    return Ticket2State();
  }
}

class Ticket2State extends State<Ticket2> {
  var currentTicket= "s";
  //will load the current ticket

  String state="klkjn";

  String tickettype="jknhjb";

  String subline = "...";

  @override
  void initState() {
    super.initState();

    NXGetTicketDetails(widget.txdbid).then((value) {
      print(value['ticketSubtitle']);
      print(value['ticketName']);
      print(value);

      NXFindRawTicket(value['ticketSubtitle'],value['ticketSubtitle2'],value['ticketName']).then((value2) {
        setState(() {
          subline = value2['subline'];

          state = value['ticketSubtitle2'];
          tickettype = value['ticketName'];
        });
      });
    });

    // NXHelp().getTicketWalletInfoByID(id: widget.txdbid).then((value) {

    //   List<TicketWalletModel> allT= value;

    //   allT[0].getTicketData().then((value) {
    //     TicketModel tikData=value;
    //     setState(() {
    //       state=tikData.state;
    //       tickettype= tikData.tickettitle;
    //       currentTicket="d";
    //     });
    //   });

    // });

    // NXHelp().getTicketById(id: widget.txdbid).then((ticket) {
    //   if (ticket.length == 0) {
    //     //ticket invalid
    //     throw ("invalid ticket");
    //   } else {
    //     setState(() {
    //       currentTicket = ticket["list"][0];
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: currentTicket != null
            ? Column(
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
                          child: Text(
                            "Close",
                            style:GoogleFonts.roboto(
                              fontSize: 16
                            )
                          ),
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
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(185, 0, 9, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                      left: 10,
                                      child: MovingText(
                                        textContent: "$state $tickettype",
                                        isUpper: false,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                         
                            Container(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Nxsig(
                                    isRounded: true,
                                    state: state,
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "ACTIVATE JUST BEFORE BOARDING",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0.3,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(
                                      112,
                                      112,
                                      112,
                                      1,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 6),
                              child: InkWell(
                                onTap: () {
                                  TicketOverlayHelper()
                                      .displayActivationDialog(context,widget.txdbid);
                                },
                                child: Container(
                                  color: Color.fromRGBO(46, 150, 32, 1),
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      "Activate Ticket",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 0.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 12, top: 10),
                              child: Container(
                                color: Color.fromRGBO(26, 108, 151, 1),
                                height: 60,
                                child: Center(
                                    child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.launch,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "NX Rewards Cashback",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 0.3),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Expanded(child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Text(subline,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  fontSize: 16
                                ),
                                ),
                              ),
                            )),
                            MySeparator(
                              color: Color.fromRGBO(211, 211, 211, 1),
                            ),
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    ActionOverlay().display(context);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.more_horiz,color: Color.fromRGBO(24,142,177,1)),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Actions",
                                        style: TextStyle(
                                            color: Color.fromRGBO(24,142,177,1),
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
                                          builder: (context) => TicketDetail(
                                            txid: widget.txdbid,
                                            isDaysLeft: true,
                                          )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 17.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon:
                                              Icon(Icons.format_list_bulleted,
                                              size: 20,
                                              color: Color.fromRGBO(24,142,177,1),
                                              ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                              color: Color.fromRGBO(24,142,177,1),
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
              )
            : Container(),
      ),
    );
  }
}



class MySeparator extends StatelessWidget {
  const MySeparator({Key key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}