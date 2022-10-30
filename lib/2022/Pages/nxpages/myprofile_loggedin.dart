import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileLoggedIn extends StatefulWidget {
  @override
  State<MyProfileLoggedIn> createState() => _MyProfileLoggedInState();
}

class _MyProfileLoggedInState extends State<MyProfileLoggedIn> {
  var loggedInEmail = null;

  final Box = GetStorage();

  @override
  void initState() {
    super.initState();

    setState(() {
      loggedInEmail = Box.read('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
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
                        child: Positioned(
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "images/front/back.svg",
                                width: 21,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("My profile",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: Container(
              color: Color.fromRGBO(169, 27, 26, 1),
            ),
          ),
          Container(
            color: Colors.white,
            height: 80,
            child: Container(
              child: Center(
                child: Text(
                  "Log out $loggedInEmail",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
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
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(188, 156, 107, 1),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              margin: EdgeInsets.only(top: 17, bottom: 14),
            ),
          )
        ],
      )),
    );
  }
}
