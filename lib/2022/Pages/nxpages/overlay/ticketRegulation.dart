import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class TicketRegulatorPage extends StatelessWidget {
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
                      right: -50,
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
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Ticket regulations",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20,right: 50),
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Adult West Midlands Daysaver",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                     Text(
                      "This ticket is valid on the day of first activation only.",
                      style: GoogleFonts.roboto(
                         fontSize: 16),
                    ),
                    SizedBox(height: 5,),
                     Text(
                      "Valid on all National Express West Midlands and National Express Coventry buses.",
                      style: GoogleFonts.roboto(
                         fontSize: 16),
                    ),
                    SizedBox(height: 20,),
                     Text(
                      "Valid on all National Express West Midlands and National Express Coventry buses.",
                      style: GoogleFonts.roboto(
                         fontSize: 16),
                    ),

                  ],
                ),
              ),
            ))
          ],
        )));
  }
}
