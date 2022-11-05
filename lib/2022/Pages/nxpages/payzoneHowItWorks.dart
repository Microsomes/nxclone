
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PayzoneHowItWorks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PayzoneHowItWorksState();
  }
}

class PayzoneHowItWorksState extends State<PayzoneHowItWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Container(
              width: double.infinity,
              height: 80,
              color: Color.fromRGBO(169, 27, 26, 1),
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
                              style: GoogleFonts.roboto(fontSize: 16,
                              color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("How it works",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
        ],
      ));
  }
  }

                                