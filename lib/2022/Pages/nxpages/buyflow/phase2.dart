import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyFlowPhase2 extends StatefulWidget {
  String subtitle;
  String title;

  Map tickets;

  BuyFlowPhase2({@required this.title, @required this.subtitle, this.tickets});

  @override
  State<StatefulWidget> createState() {
    return new UtilitiesMenuState();
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UtilitiesMenuState extends State<BuyFlowPhase2> {


  var niceTickets = [];


  @override
  void initState() {
    super.initState();

    print("init");


  for(var key in widget.tickets.keys){

    print(widget.tickets[key]);

    niceTickets.add({
      "name":widget.tickets[key]['name'],
      "price": num.parse(widget.tickets[key]['price'].toString()).toStringAsFixed(2),
      "subtitle":widget.tickets[key]['subline']
    });              
  }           

  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(168, 0, 0, 1),
      body: Center(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 80,
              color: Colors.transparent,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "images/front/back.svg",
                                width: 21,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("Select ticket",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Color.fromRGBO(141, 0, 7, 1),
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.title,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Color.fromRGBO(238, 238, 238, 1),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.subtitle,
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(168, 28, 25, 1),
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5))),
                    child: Center(
                        child: Text(
                      "Single",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(139, 0, 7, 1),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5))),
                    child: Center(
                        child: Text(
                      "Multiple",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(var i=0;i<niceTickets.length;i++)
                    Builder(builder: (ctx){
                      return Container(
                        margin: EdgeInsets.only(top:i==0 ? 5: 15),
                        child: Row(
                          children: [
                            Container(width: 50,color: Colors.transparent,
                            child: Center(
                              child: Icon(Icons.info_outline,
                              size: 20,
                              color: Color.fromRGBO(180, 64, 70, 1),
                              ),
                            ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text(niceTickets[i]['name'],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17
                                    ),
                                    ),
                                    SizedBox(height: 12,),
                                     Text(niceTickets[i]['subtitle'],
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6)
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Text("£"+niceTickets[i]['price'].toString(),
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                    ),),
                                    SizedBox(width: 5,),
                                    RotatedBox(
                                  quarterTurns: 2,
                                  child: SvgPicture.asset("images/front/back.svg")),
                                  SizedBox(width: 10,),
                                  ],
                                )
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
