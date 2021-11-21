import 'package:bubble_gum/v2/pages/menupage/profile/components/login.dart';
import 'package:bubble_gum/v2/pages/menupage/profile/components/newAccount.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isTickets = true;
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                color: Color.fromRGBO(167, 27, 26, 1),
                height: 60,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Text(
                        "My Profile",
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 60,
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.close)),
                    )
                  ],
                )),
            Container(
              height: 50,
              width: sizeW,
              color: Color.fromRGBO(169, 27, 26, 1),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      // _pageController.animateToPage(0,
                      //     duration: Duration(milliseconds: 1),
                      //     curve: Curves.easeIn);
                      setState(() {
                        isTickets = true;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: isTickets ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      width: sizeW / 2,
                      decoration: BoxDecoration(
                          color: isTickets == true
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(5))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTickets = false;
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "New account",
                          style: TextStyle(
                              color: isTickets != false
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      width: sizeW / 2,
                      decoration: BoxDecoration(
                          color: isTickets == false
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(5))),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: isTickets ? LoginSection() : SignUpSection(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
