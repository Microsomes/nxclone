import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/form/NXFormInput.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController password;
  TextEditingController newPassword;
  TextEditingController confirmPassword;

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
  }

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
                            style: GoogleFonts.roboto(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 50,
                child: Text("Change password",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              )
            ])),
        Expanded(
          child: Container(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  NXFormInputComponent(
                    controller: password,
                    label: "Password",
                    tip: "",
                    validator: (String val) {
                      if (val.length <= 5) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NXFormInputComponent(
                    controller: newPassword,
                    label: "New password",
                    tip:
                        "Passwords should be at least 8 characters long and include a number, a lowercase and an uppercase letter.",
                    validator: (String val) {
                      if (val.length <= 5) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NXFormInputComponent(
                    controller: confirmPassword,
                    label: "Confirm new password",
                    tip: "",
                    validator: (String val) {
                      if (val.length <= 5) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Change password",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color.fromRGBO(107, 107, 107, 1),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
