import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Learn.Intro"),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: RotatedBox(
                        child: Text(
                          "WELCOME",
                          style: GoogleFonts.dekko(
                              fontSize: 40, color: Colors.white),
                        ),
                        quarterTurns: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Welcome to Black Pie.",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "B_R_E_I_F",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Black Pie is a clone of the NXBUS app, the aim of the clone was to learn Flutter originally and see if it was possible to recreate the NXBUS app. I've shown the app to multiple people and most can't tell the clone apart from the real app.",
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "L_E_G_A_L",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Do not use the app on a real Bus Driver, You could get in trouble. Even if it would probably work on a real driver, we do not accept liability if you get in trouble when using this clone. ",
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "A_D_D_I_T_I_O_N_A_L",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
