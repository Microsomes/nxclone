import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";

class NxPagesFront extends StatefulWidget {
  @override
  State<NxPagesFront> createState() => _NxPagesFrontState();
}

class _NxPagesFrontState extends State<NxPagesFront> {
  var message =
      "We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.";

  var options = [
    {
      "type":"noticemessage",
      "label":"We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.",
    },
    {
      "type": "link",
      "page": "",
      "label": "Singles & Daysavers",
      "icon": "images/front/single-ticket.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "NX 1 Week and 4 Week",
      "icon": "images/front/tickets.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "Multi Operator 1 Week and 4 Week",
      "icon": "images/front/busicon.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "Ticket Wallet",
      "icon": "images/front/ticket-wallet.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
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
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "Trip Tools",
      "icon": "images/front/trip-tools.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type": "link",
      "page": "",
      "label": "Help",
      "icon": "images/front/uni68.svg",
      "iconColor": Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type":"justridelogo",
      "label":"just ride logo"
    }
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

class Kt extends StatelessWidget {
  const Kt({
    Key key,
    @required this.options,
  }) : super(key: key);

  final List<Map<String, Object>> options;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            for (var i = 0; i < options.length; i++)
              Builder(builder: (ctx) {
                var currentType = options[i]['type'];

                if(currentType == "noticemessage"){
                  return  Container(
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
                        child: Icon(Icons.info_outline),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 0, right: 10),
                          color: Colors.transparent,
                          child: Text(
                            options[i]['label'],
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
                                options[i]['label'],
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
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                  );
                }

                if (currentType == "link") {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SvgPicture.asset(
                                options[i]['icon'],
                                color: options[i]['iconColor'],
                                height: 25,
                              ),
                            )),
                        Expanded(
                          child: Container(
                            child: Text(
                              options[i]['label'],
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 16),
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
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                      ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    height: 45,
                    margin: EdgeInsets.only(
                        top: i == 0 ? 0 : 20, left: 10, right: 10),
                  );
                }

                if(currentType == "justridelogo"){
                  return Padding(
                    padding: const EdgeInsets.only(
                      top:80,
                      left:8.0,
                      right:8,
                      bottom: 10),
                    child: SvgPicture.asset("images/front/just-ride-full-logo.svg",
                    color: Colors.white,),
                  );
                }

                return Text(currentType);
              })
          ],
        ));
  }
}
