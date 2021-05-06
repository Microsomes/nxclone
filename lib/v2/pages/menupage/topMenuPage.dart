import 'package:flutter/material.dart';
import 'package:BubbleGum/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: InkWell(
        //       onTap: () {
        //         Navigator.pop(context, true);
        //       },
        //       child: PreferredSize(
        //           preferredSize: Size.fromHeight(500),
        //           child: Image.asset("images/leftarrow.png", width: 4))),
        //   title: Center(
        //     child: Text(
        //       "Utilities",
        //       style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
        //     ),
        //   ),
        // ),
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
                          child: Text(
                            "Utilities",
                            style: GoogleFonts.roboto(
                              color: Color.fromRGBO(189, 156, 106, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                            )
                          ),
                        ),
                        height: 55,
                        color: Colors.white,
                      ),
                       GestureDetector(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: Image.asset("images/leftarrow.png", width: 35)),
                        ],
                      )
                    ),
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
                      style: GoogleFonts.roboto(
                          color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                NavItem(
                  image: Image.asset(
                    "images/v3/people.png",
                    width: 30,
                  ),
                  onTap: () {
                    print("profile page");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MyProfile()));
                  },
                  name: "My Profile",
                ),
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
                      style: GoogleFonts.roboto(
                          color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                NavItem(
                  onTap: (){
                    launchURL("https://nxbus.co.uk");
                  },
                  image: Image.asset(
                    "images/v3/pointer.png",
                    width: 30,
                  ),
                  name: "nxbus.co.uk",
                ),
                SizedBox(
                  height: 13,
                ),
                NavItem(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (ctx)=>SocialMediaPage()
                    ));
                  },
                  image: Image.asset(
                    "images/v3/thumb.png",
                    width: 30,
                  ),
                  name: "Social Media",
                ),
                SizedBox(
                  height: 13,
                ),
                NavItem(
                  image: Image.asset(
                    "images/v3/scan.png",
                    width: 30,
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
            width: 10,
          ),
          // Icon(
          //   Icons.account_circle,
          //   color: Colors.black,
          //   size: 30,
          // ),
          image,
          SizedBox(
            width: 10,
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
