import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase4.dart';
import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase4SavedCart.dart';
import 'package:BubbleGum/2022/Pages/nxpages/tripWallet.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyFlowPhase5Success extends StatelessWidget {
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
                    child: Text("Confirmation ",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Container(
              width: double.infinity,
              height: 43,
              color: Color.fromRGBO(134, 8, 5, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: double.infinity,
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
            Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: Center(
                            child: SvgPicture.asset(
                              "images/front/tick.svg",
                              color: Color.fromRGBO(34, 167, 0, 1),
                              width: 130,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Transaction Successful",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(left: 100, right: 100),
                          child: Text(
                            "Please activate your ticket just before boarding.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                color: Colors.black.withOpacity(0.8)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TripWallet()));                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 39, right: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(194, 159, 90, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Center(
                              child: Text(
                                "Go to Ticket Wallet",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 39, right: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(194, 149, 99, 1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Center(
                            child: Text(
                              "NX Rewards Cashback",
                              style: GoogleFonts.roboto(
                                color: Color.fromRGBO(194, 149, 99, 1),
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    )))
          ],
        )));
  }
}
