import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class BuyFlowPhase3 extends StatelessWidget{
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
                                  style: GoogleFonts.roboto(fontSize: 16,
                                  color: Colors.white
                                  ),
                                )
                              ],
                            ),
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
                      SizedBox(height: 3,),
                      Container(
                        width: 200,
                        height: 6,
                        color: Color.fromRGBO(191, 156, 102, 1),
                      )
                    ],
                  ),
                ),
            Expanded(
              child:Container(
                color: Colors.white,
              )
            )
          ],
        )));
  }

}