import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAdvanced extends StatefulWidget {
  @override
  _NewAdvancedState createState() => _NewAdvancedState();
}

class _NewAdvancedState extends State<NewAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 139, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: Text("Pick a Ticket",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center),
            ),
            Expanded(
              child: GFTabs(
                controller: null,
                tabBarColor: Color.fromRGBO(0, 0, 139, 1),
                initialIndex: 0,
                length: 4,
                tabs: <Widget>[
                  Tab(
                    icon: Image.asset(
                      "images/v7/bus.png",
                      width: 20,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Bus",
                    ),
                  ),
                  Tab(
                    icon: Image.asset(
                      "images/v7/tram.png",
                      width: 20,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Tram",
                    ),
                  ),
                  Tab(
                    icon: Image.asset(
                      "images/v7/tram.png",
                      width: 20,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Group",
                    ),
                  ),
                  Tab(
                    icon: Image.asset(
                      "images/v7/students.png",
                      width: 20,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Students",
                    ),
                  ),
                ],
                tabBarView: GFTabBarView(
                  controller: null,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.directions_bike),
                      color: Colors.red,
                    ),
                    Container(
                      child: Icon(Icons.directions_bus),
                      color: Colors.blue,
                    ),
                    Container(
                      child: Icon(Icons.directions_railway),
                      color: Colors.orange,
                    ),
                    Container(
                      child: Icon(Icons.directions_railway),
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
