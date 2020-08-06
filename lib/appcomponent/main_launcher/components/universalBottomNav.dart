import 'package:flutter/material.dart';

class LandingUtils {
  openBottomNavWithList(
      List<String> list, Function callback, BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Text(
                    "Select a color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(child: Text("h"))
                ],
              ));
        });
  }
}
