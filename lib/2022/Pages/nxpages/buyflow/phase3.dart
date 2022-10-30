import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase4.dart';
import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase4SavedCart.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyFlowPhase3 extends StatelessWidget {
  final String ticketName;
  final String ticketSubtitle;
  final String ticketSubtitle2;
  final String ticketPrice;

  BuyFlowPhase3(
      {@required this.ticketName,
      @required this.ticketSubtitle,
      @required this.ticketSubtitle2,
      @required this.ticketPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 27, 28, 1),
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Color.fromRGBO(185, 0, 9, 1),
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
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Select payment method  ",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Container(
              width: double.infinity,
              height: 40,
              color: Color.fromRGBO(134, 8, 5, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 200,
                    height: 6,
                    color: Color.fromRGBO(191, 156, 102, 1),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    color: Colors.transparent,
                    child: Text(
                      ticketSubtitle,
                      style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ))
                ],
              ),
            ),
            Container(
              height: 40,
              color: Color.fromRGBO(238, 238, 238, 1),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      ticketName,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Text(
                    "1x",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(),
                  ),
                  Text(
                    "£" + ticketPrice,
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              color: Color.fromRGBO(185, 0, 9, 1),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "TOTAL                              ",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Text(
                    "   ",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(),
                  ),
                  Text(
                    "£" + ticketPrice,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => BuyFlowPhase4WithCard(
                                          ticketName: ticketName,
                                          ticketSubtitle: ticketSubtitle,
                                          ticketSubtitle2: ticketSubtitle2,
                                          ticketPrice: ticketPrice,
                                        )));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 90,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "images/front/visa.svg",
                                      width: 40,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ".... .... ....",
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 10),
                                              child: Text(
                                                "3940",
                                                style: GoogleFonts.roboto(),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Expires 02/26",
                                          style: GoogleFonts.roboto(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: Center(
                                    child: RotatedBox(
                                        quarterTurns: 2,
                                        child: SvgPicture.asset(
                                          "images/front/back.svg",
                                          color: Color.fromRGBO(166, 53, 61, 1),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 85),
                            child: Divider()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => BuyFlowPhase4(
                                          ticketSubtitle: ticketSubtitle,
                                          ticketSubtitle2: ticketSubtitle2,
                                          ticketName: ticketName,
                                          ticketPrice: ticketPrice,
                                        )));
                          },
                          child: Container(
                            height: 85,
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "images/front/large-plus.svg",
                                      color: Color.fromRGBO(185, 0, 9, 1),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Add and Pay with New Card",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "Cards can be saved for quick access",
                                        style: GoogleFonts.roboto(),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Divider()
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        )));
  }
}
