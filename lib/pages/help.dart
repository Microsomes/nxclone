import 'package:BubbleGum/pages/terms.dart';
import 'package:flutter/material.dart';

import './help/applicationinfo.dart';

import './help/customerService.dart';

import './help/faq.dart';

import 'package:BubbleGum/pages/settings.dart';

import 'package:google_fonts/google_fonts.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stpage();
  }
}

class Stpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Stpagestate();
  }
}

class Stpagestate extends State<Stpage> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Center(
            child: Text(
              "Help",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: sizeW,
          color: Color.fromRGBO(167, 27, 26, 1),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplicationInfoPage()));
                  },
                  child: Container(
                    width: 380,
                    height: 50,
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
                      Image.asset(
                        "images/appinfo.png",
                        width: 50,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "App info",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      Image.asset("images/rightarrow.png", width: 35),
                      SizedBox(
                        width: 4,
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerServicePage()));
                  },
                  child: Container(
                    width: 380,
                    height: 50,
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
                      Image.asset(
                        "images/customerservice.png",
                        width: 50,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Customer Service",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      Image.asset("images/rightarrow.png", width: 35),
                      SizedBox(
                        width: 4,
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqPage()));
                },
                child: Container(
                  width: 380,
                  height: 50,
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
                    Image.asset(
                      "images/faq.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "FAQ",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditions()));
                },
                child: Container(
                  width: 380,
                  height: 50,
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
                    Image.asset(
                      "images/termes.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Terms and conditions",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
