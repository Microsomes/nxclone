import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyFlowPhase2 extends StatefulWidget {
  String subtitle;
  String title;

  BuyFlowPhase2({@required this.title,@required this.subtitle});

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
  Future readTicketFile() async {
    final String response = await rootBundle.loadString("assets/tickets.json");
    final data = await jsonDecode(response);

    final sections = data['sections'];

    final pickedOne = sections[widget.subtitle];

    return pickedOne;
  }

  @override
  void initState() {
    super.initState();
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
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.subtitle,
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 15,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}
