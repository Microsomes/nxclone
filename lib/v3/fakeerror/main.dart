import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(165, 28, 26, 1),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Error",
                            style: GoogleFonts.aBeeZee(
                              fontSize: 40
                            ),
                            ),
                             Text("Something caused the app to crash. Restart app to continue",
                            style: GoogleFonts.roboto(
                              fontSize: 20
                            ),
                            )
                          ],
                        ),
        margin: EdgeInsets.all(60),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
      color:Colors.white,
            borderRadius: BorderRadius.circular(20),
        ),
      ),
          ),
        ],
      )
    );
  }
}
