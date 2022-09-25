import 'package:BubbleGum/2022/2022helper.dart';
import 'package:BubbleGum/2022/Pages/nxpages/myprofile.dart';
import 'package:BubbleGum/2022/Pages/nxpages/tripWallet.dart';
import 'package:BubbleGum/pages/help.dart';
import 'package:BubbleGum/pages/tripTools.dart';
import 'package:BubbleGum/v7/afterDisclaimerQuickMenu.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";

import '../../../v2/pages/menupage/topMenuPage.dart';
import 'buyflow/phase1.dart';

class NxPagesFront extends StatefulWidget {
  @override
  State<NxPagesFront> createState() => _NxPagesFrontState();
}

class _NxPagesFrontState extends State<NxPagesFront> {
  var message =
      "We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.";

  var options = [
    // {
    //   "type":"noticemessage",
    //   "label":"We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.",
    // },
    {
      "type": "link",
      "page": "",
      "label": "Singles & Daysavers",
      "icon": "images/front/single-ticket.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page
        print("single catalogue page");

        Navigator.push(
            ctx,
            MaterialPageRoute(
                builder: (context) => BuyFlowPhase1(
                      subtitle: "Singles & Daysavers",
                    )));
      }
    },
    {
      "type": "link",
      "page": "",
      "label": "NX 1 Week and 4 Week",
      "icon": "images/front/tickets.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page
        print("nx1 week and 4 week page");
        Navigator.push(
            ctx,
            MaterialPageRoute(
                builder: (context) => BuyFlowPhase1(
                      subtitle: "NX 1 Week and 4 Week",
                    )));
      }
    },
    {
      "type": "link",
      "page": "",
      "label": "Multi Operator 1 Week and 4 Week",
      "icon": "images/front/busicon.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page
        print("multi operator page 1 week and 4 week");
        Navigator.push(
            ctx,
            MaterialPageRoute(
                builder: (context) => BuyFlowPhase1(
                      subtitle: "Multi Operator 1 Week and 4 Week",
                    )));
      }
    },
    {
      "type": "link",
      "page": "",
      "label": "Ticket Wallet",
      "icon": "images/front/ticket-wallet.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page

        Navigator.push(
            ctx, MaterialPageRoute(builder: (context) => TripWallet()));
      }
    },
    {
      "type": "wallet",
      "page": "",
      "label": "Your top tickets will appear here for quick access",
      "icon": "images/front/single-ticket.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "Payzone Barcode",
      "icon": "images/front/DBarcode.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page

        Navigator.push(
            ctx, MaterialPageRoute(builder: (context) => MyProfile()));
      }
    },
    {
      "type": "link",
      "page": "",
      "label": "Trip Tools",
      "icon": "images/front/trip-tools.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page
        print("trip tools page");

        Navigator.push(
            ctx, MaterialPageRoute(builder: (context) => TripTools()));
      }
    },
    {
      "type": "link",
      "page": "",
      "label": "Help",
      "icon": "images/front/uni68.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1),
      "func": (BuildContext ctx) {
        //go to Single page
        Navigator.push(
            ctx, MaterialPageRoute(builder: (context) => HelpPage()));
      }
    },
    {"type": "justridelogo", "label": "just ride logo"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
              color: Colors.white,
              height: 95,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Image.asset(
                          "images/front/header.png",
                          width: 150,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  Positioned(
                    right: -20,
                    bottom: -1,
                    child: GestureDetector(
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AfterDisclaimer()));
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UtilitiesMenu()));
                      },
                      child: Container(
                        child: SizedBox(
                            height: 50,
                            width: 100,
                            child: Icon(
                              Icons.menu,
                              color: Color.fromRGBO(168, 27, 26, 1),
                              size: 30,
                            )),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              child: Container(
            color: Color.fromRGBO(168, 27, 26, 1),
            child: Column(
              children: [
                Expanded(
                    child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Kt(options: options),
                    )
                  ],
                ))
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class Kt extends StatefulWidget {
  const Kt({
    Key key,
    @required this.options,
  }) : super(key: key);

  final List<Map<String, Object>> options;

  @override
  State<Kt> createState() => _KtState();
}

class _KtState extends State<Kt> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            for (var i = 0; i < widget.options.length; i++)
              Builder(builder: (ctx) {
                var currentType = widget.options[i]['type'];

                if (currentType == "noticemessage") {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 0),
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(189, 156, 107, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.topCenter,
                            color: Colors.transparent,
                            width: 40,
                            child: SvgPicture.asset(
                              "images/front/info.svg",
                              color: Colors.black,
                              width: 18,
                            )),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 0, right: 10),
                            color: Colors.transparent,
                            child: Text(
                              widget.options[i]['label'],
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }

                if (currentType == "wallet") {
                  return FutureBuilder(
                      future: GetFirstAvailableTicket(),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            print(snapshot.data['id']);
                            return Container(
                              width: double.infinity,
                              margin:
                                  EdgeInsets.only(top: 15, right: 10, left: 10),
                              height: 220,
                              child: Column(
                                children: [

                                  Container(
                                    height: 140,
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20,top: 10),
                                                      child: Text("Single Tickets",
                                                      style:GoogleFonts.roboto(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16
                                                      ),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20,top: 2),
                                                      child: Text("Single - West Midlands",
                                                      style: GoogleFonts.roboto(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15
                                                      ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.centerRight,
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 20),
                                                      child: Text("INACTIVE",
                                                      style: GoogleFonts.roboto(
                                                        color: Color.fromRGBO(106, 106, 106, 1),
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,right: 20
                                              ),
                                              child: Divider(
                                                color: Colors.grey.withOpacity(0.8)
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 6
                                                ),
                                                child: Text("Expires in 2 days, 7 hours",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.red,
                                                  fontSize: 12
                                                ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      right: 30,
                                      top: 30
                                    ),
                                    width: double.infinity,
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("More tickets",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                        ),
                                        SizedBox(width: 10,),
                                        SvgPicture.asset("images/front/arrow.svg",
                                        color: Colors.white,
                                        width: 20,
                                        )

                                      ],
                                    )
                                  )

                                ],
                              ),
                              
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(124, 26, 17, 1),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(123, 26, 17, 1),
                                      spreadRadius: 1,
                                      blurRadius: 0,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ]),
                            );
                          }
                        }

                        return Container(
                          margin: EdgeInsets.only(top: 15, right: 10, left: 10),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 60,
                                child: Center(
                                  child: SvgPicture.asset(
                                    "images/front/single-ticket.svg",
                                    color: Colors.white,
                                    width: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 60,
                                    child: Text(
                                      widget.options[i]['label'],
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(124, 26, 17, 1),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(123, 26, 17, 1),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ]),
                        );
                      });
                }

                if (currentType == "link") {
                  return Listener(
                    onPointerDown: (event) {
                      print("point down");
                      widget.options[i]['hov'] = Color.fromRGBO(134, 8, 5, 1);
                      widget.options[i]['hovText'] = Colors.white;
                      setState(() {});
                    },
                    onPointerUp: (event) {
                      print("point up");
                      widget.options[i]['hov'] = Colors.white;
                      widget.options[i]['hovText'] = Colors.black;

                      setState(() {});
                    },
                    child: GestureDetector(
                      onTap: () {
                        print("link was selected");
                        Function fn = widget.options[i]['func'];
                        fn(context);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: SvgPicture.asset(
                                    widget.options[i]['icon'],
                                    color: widget.options[i]['iconColor'],
                                    height: 25,
                                  ),
                                )),
                            Expanded(
                              child: Container(
                                child: Text(
                                  widget.options[i]['label'],
                                  style: GoogleFonts.roboto(
                                      color:
                                          widget.options[i]['hovText'] != null
                                              ? widget.options[i]['hovText']
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Icon(
                                Icons.chevron_right,
                                size: 35,
                                color: Color.fromRGBO(172, 22, 32, 1),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(158, 25, 26, 1),
                                spreadRadius: 1,
                                blurRadius: 0,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            color: widget.options[i]['hov'] != null
                                ? widget.options[i]['hov']
                                : Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        height: 45,
                        margin: EdgeInsets.only(
                            top: i == 0 ? 0 : 20, left: 10, right: 10),
                      ),
                    ),
                  );
                }

                if (currentType == "justridelogo") {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 80, left: 8.0, right: 8, bottom: 10),
                    child: SvgPicture.asset(
                      "images/front/just-ride-full-logo.svg",
                      color: Colors.white,
                    ),
                  );
                }

                return Text(currentType);
              })
          ],
        ));
  }
}
