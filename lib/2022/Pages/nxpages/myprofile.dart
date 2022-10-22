import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/form/NXFormInput.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(169, 26, 25, 1),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 73,
              color: Colors.transparent,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    right: 0,
                    top: 38,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Icon(
                                Icons.close,
                                size: 28,
                                color: Colors.white.withOpacity(0.95),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 44,
                  child: Text("My profile",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            color: Color.fromRGBO(139, 0, 8, 1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = true;
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              color: isLogin == false
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: isLogin == false
                                              ? Color.fromRGBO(139, 0, 8, 1)
                                              : Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = false;
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "New Account",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              color: isLogin == true
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      color: isLogin == true
                                          ? Color.fromRGBO(139, 0, 8, 1)
                                          : Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          LoginForm()
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          NXFormInputComponent(
            label: "Email",
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          NXFormInputComponent(
            label: "Password",
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
