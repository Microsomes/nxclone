import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Email",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(215, 216, 218, 1), width: 2))),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Password",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(215, 216, 218, 1), width: 2))),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Center(
              child: Text("Log in",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color.fromRGBO(136,136,136,1)
              ),
              ),
            ),
          )
,
SizedBox(height:40),
          Text("Forgot my password",
          style: GoogleFonts.roboto(
            color: Color.fromRGBO(194,174,139,1),
            fontSize: 17,
            decoration: TextDecoration.underline
          ),
          )
        
        ],
      ),
    );
  }
}
