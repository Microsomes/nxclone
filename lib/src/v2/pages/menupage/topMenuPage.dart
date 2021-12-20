import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import './socialMediaPage.dart';

import 'profile/LoginIn.dart';

class UtilitiesMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UtilitiesMenuState();
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UtilitiesMenuState extends State<UtilitiesMenu> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      value.setBool("is_logged_in", true);
      if (value.get("is_logged_in") != null) {
        isLoggedIn = true;
        setState(() {});
      } else {
        print("user is not logged in");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: sizeW,
      color: Color.fromRGBO(167, 27, 26, 1),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            PhysicalModel(
                elevation: 2,
                color: Colors.red,
                shadowColor: Color.fromRGBO(215, 216, 218, 1),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      child: Center(
                        child: Text("Utilities",
                            style: GoogleFonts.roboto(
                                color: Color.fromRGBO(189, 156, 106, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 17)),
                      ),
                      height: 55,
                      color: Colors.white,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("images/leftarrow.png", width: 35)),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "ACCOUNT",
                  style:
                      GoogleFonts.roboto(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            NavItem(
              image: Image.asset(
                "images/v3/people.png",
                width: 25,
              ),
              onTap: () {
                print("profile page");
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MyProfile()));
              },
              name: "My Profile",
            ),
            SizedBox(
              height: 10,
            ),
            isLoggedIn == true
                ? NavItem(
                    image: Image.asset(
                      "images/v7/marketingicon_1.jpeg",
                      width: 22,
                    ),
                    onTap: () {
                      launchURL(
                          "https://nxbusportal.co.uk/masabi/?appid&accountid");
                    },
                    name: "Marketing Preferences",
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "TOOLS",
                  style:
                      GoogleFonts.roboto(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            NavItem(
              onTap: () {
                launchURL("https://nxbus.co.uk");
              },
              image: Image.asset(
                "images/v3/pointer.png",
                width: 23,
              ),
              name: "nxbus.co.uk",
            ),
            SizedBox(
              height: 10,
            ),
            NavItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SocialMediaPage()));
              },
              image: Image.asset(
                "images/v3/thumb.png",
                width: 25,
              ),
              name: "Social Media",
            ),
            SizedBox(
              height: 10,
            ),
            NavItem(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MyProfile()));
              },
              image: Image.asset(
                "images/v3/scan.png",
                width: 25,
              ),
              name: "Payzone Barcode",
            ),
          ],
        ),
      ),
    ));
  }
}

class NavItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final Widget image;

  const NavItem({
    @required this.name,
    @required this.image,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 380,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(215, 216, 218, 1),
                  offset: new Offset(0, 3))
            ]),
        child: Row(children: <Widget>[
          SizedBox(
            width: 20,
          ),
          // Icon(
          //   Icons.account_circle,
          //   color: Colors.black,
          //   size: 30,
          // ),
          image,
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Text(
              "$name",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          Image.asset("images/rightarrow.png", width: 35),
          SizedBox(
            width: 4,
          )
        ]),
      ),
    );
  }
}
