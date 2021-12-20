import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPageHasBeenUpdated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 249, 248, 1),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("images/v7/ticketpageicon.png"),
          )),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Text(
                  "The ticket screen has been updated",
                  style: GoogleFonts.roboto(
                      color: Color.fromRGBO(195, 103, 103, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 22),
                Text(
                  "Continue to show your ticket to the driver as normal when requested",
                  style: GoogleFonts.roboto(
                    color: Color.fromRGBO(195, 103, 103, 1),
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.transparent,
                  height: 90,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(169, 27, 26, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(185, 147, 146, 1),
                                offset: const Offset(0.0, 2.0)),
                          ]),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 65,
                      child: Center(
                        child: Text(
                          "Done",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            height: 90,
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(child: Container()),
                Text(
                  "SKIP",
                  style: GoogleFonts.roboto(
                      color: Color.fromRGBO(142, 61, 60, 1), fontSize: 17),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
