import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/homecomp/Planner.dart';
import 'components/homecomp/covidplan.dart';

import './purchase.dart';

class MyMetro extends StatefulWidget {
  @override
  _MyMetroState createState() => _MyMetroState();
}

class _MyMetroState extends State<MyMetro> {
  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              Container(
                padding: EdgeInsets.all(3),
                width: 110,
                child: Image.asset(
                  "images/mymetro/logo1.png",
                  width: 30,
                ),
              )
            ],
            title: Text(
              "Home",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
            backgroundColor: Color.fromRGBO(52, 52, 62, 1)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomIndex,
          backgroundColor: Colors.black,
          onTap: (int index) {
            setState(() {
              bottomIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.train,
                color: Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: "Purchase",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.app_settings_alt_rounded,
                  color: Colors.grey,
                ),
                label: "My Tickets"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              label: "Settings",
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: SingleChildScrollView(
          child: Builder(
            builder: (ctx) {
              if (bottomIndex == 0) {
                return Home();
              } else if (bottomIndex == 1) {
                return PurchasePage();
              }
              return Home();
            },
          ),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6),
        CovidPlanner(),
        SizedBox(height: 20),
        Planner()
      ],
    );
  }
}
