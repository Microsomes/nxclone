import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermesOfUseP extends StatelessWidget {
  Function onaccept;
  Function ondisconnect;
  TermesOfUseP({@required this.onaccept,@required this.ondisconnect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Eductional Terms",
          style: GoogleFonts.acme(),
        ),
      ),
      body: Scaffold(
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please be aware this app is for educational purposes only.",
              style: GoogleFonts.acme(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Text(
                "I Accept",
                style: GoogleFonts.acme(color: Colors.black),
              ),
              onPressed: () {
                onaccept();
              },
            ),
            SizedBox(height: 10,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Text(
                "I Do not accept",
                style: GoogleFonts.acme(color: Colors.black),
              ),
              onPressed: () {
                ondisconnect();
              },
            )
          ],
        )),
      ),
    );
  }
}
