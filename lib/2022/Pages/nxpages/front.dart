import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";

class NxPagesFront extends StatefulWidget {
  @override
  State<NxPagesFront> createState() => _NxPagesFrontState();
}

class _NxPagesFrontState extends State<NxPagesFront> {


  var message = "We join the nation in mouring the death of Her Majesty Queen Elizabeth. Our heartfelt thoughts and sympathies are with the Royal Family at this time.";

  var options = [
    {
      "type":"link",
      "page":"",
      "label":"Singles & Daysavers",
      "icon":"images/front/single-ticket.svg",
      "iconColor":Color.fromRGBO(168, 25, 31, 1)
    },
    {
      "type":"link",
      "page":"",
      "label":"NX 1 Week and 4 Week",
      "icon":"images/front/tickets.svg",
      "iconColor":Color.fromRGBO(168, 25, 31, 1)

    },
    {
      "type":"link",
      "page":"",
      "label":"Multi Operator 1 Week and 4 Week",
      "icon":"images/front/tickets.svg",
      "iconColor":Color.fromRGBO(168, 25, 31, 1)
    },
    {
       "type":"walletlink",
      "page":"",
      "label":"Ticket Wallet",
      "icon":"images/front/ticket-wallet.svg",
      "iconColor":Color.fromRGBO(168, 25, 31, 1)
    },
    {
       "type":"wallet",
      "page":"",
      "label":"Your top tickets will appear here for quick access",
      "icon":"images/front/single-ticket.svg"

    },
    {
       "type":"link",
      "page":"",
      "label":"Payzone Barcode",
      "icon":"images/front/DBarcode.svg"

    },
    {
       "type":"link",
      "page":"",
      "label":"Trip Tools",
      "icon":"images/front/trip-tools.svg"
    },
    {
       "type":"link",
      "page":"",
      "label":"Help",
      "icon":"images/front/uni68.svg"
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
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(188, 156, 107, 0.7),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:20),
                        alignment: Alignment.topCenter,
                        color: Colors.transparent,
                        width: 40,
                        child: Icon(Icons.info_outline),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left:0,
                            right: 10
                          ),
                          color: Colors.transparent,
                          child: Text(message,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (ctx,index){

                      switch(options[index]['type']){
                        case "link":
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right:30),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:20.0),
                                  child: SvgPicture.asset(options[index]['icon']),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(options[index]['label'],
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                child: Icon(Icons.chevron_right,
                                size: 35,
                                color: Color.fromRGBO(172, 22, 32, 1),),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          height: 45,
                          margin: EdgeInsets.only(top:index == 0 ? 0 : 20,
                          left: 10,
                          right: 10
                          ),
                        );
                        case "wallet":
                        return Text("wallet");
                      }

                    return Text(options[index]['label']);
                  
                  }),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
