import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyFlowPhase4 extends StatelessWidget {
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
                    child: Text("Enter card information",
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
                      "Singles and Daysavers",
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
                      "All day - West Midlands",
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
                    "£4.00",
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
                    "  ",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(),
                  ),
                  Text(
                    "£4.00",
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
                        Container(
                          height: 85,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ],
                    )))
          ],
        )));
  }
}
