import 'package:bubble_gum/src/v2/pages/ticketv2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSection extends StatefulWidget {
  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void forgotPasswordDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            backgroundColor: Color.fromRGBO(248, 248, 248, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: ForgotPassword()));
  }

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
            child: Center(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration.collapsed(hintText: ""),
              ),
            ),
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
              child: Text(
                "Log in",
                style: GoogleFonts.roboto(
                    fontSize: 20, color: Color.fromRGBO(136, 136, 136, 1)),
              ),
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              this.forgotPasswordDialog(context);
            },
            child: Text(
              "Forgot my password",
              style: GoogleFonts.roboto(
                  color: Color.fromRGBO(194, 174, 139, 1),
                  fontSize: 17,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Text(
            "Forgot my password",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Please enter your email",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Color.fromRGBO(188, 83, 83, 1), width: 2)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Text(
                "Cancel",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(48, 51, 57, 1)),
              ),
            ),
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(
                    color: Color.fromRGBO(188, 83, 83, 1), width: 2)),
          ),
          Container(
            color: Colors.transparent,
            height: 90,
            child: Center(
              child: InkWell(
                onTap: () {},
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
                      "OK",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
