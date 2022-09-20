import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TripWallet extends StatefulWidget {
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

class UtilitiesMenuState extends State<TripWallet> {
  var sections = [
    {
      "section": "Departure Information",
      "links": [
        {
          "type": "link",
          "label": "Timetables",
          "icon": "images/front/clock.svg",
          "action": () {}
        }
      ]
    },
    {
      "section": "Service changes",
      "links": [
        {
          "type": "link",
          "label": "Service changes",
          "icon": "images/front/customer-alerts.svg",
          "action": () {}
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 27, 28, 1),
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Color.fromRGBO(168, 28, 25, 1),
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
                    child: Text("Ticket wallet",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              color: Color.fromRGBO(168, 28, 25, 1),
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5))),
                                      child: Center(
                                          child: Text(
                                        "Tickets",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(139, 0, 7, 1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5))),
                                      child: Center(
                                          child: Text(
                                        "History",
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
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 120,),
                                      SvgPicture.asset(
                                        "images/front/tickets.svg",
                                        color: Color.fromRGBO(168, 26, 25, 1),
                                        width: 100,
                                      
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Can't see your tickets?",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19
                                      ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("Log in or create an account below",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16
                                      ),
                                      )
                                    ],
                                  ),
                                )
                              ),
                            )
                          
                          ],
                        )))
              ],
            )),
            Container(
              color: Colors.red,
              height: 120,
            )
          ],
        )));
  }
}
