import 'dart:ui';

import 'package:bubble_gum/src/v2/components/movingText.dart';
import 'package:bubble_gum/src/v2/components/nxsig.dart';
import 'package:bubble_gum/src/v2/components/ticketColor.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AnimationOverlayContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationOverlayContentState();
  }
}

class AnimationOverlayContentState extends State<AnimationOverlayContent> {
  double _velocity = 50.00;

  double _currentColorSpeed = 500.00;

  Future saveOption(String key, String val) async {
    var db = await openDatabase(NXHelp.dbName);
    db.execute(
        "CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
    var iid = await db
        .rawInsert("INSERT INTO config(key, val) VALUES(?, ?)", [key, val]);
    return iid;
  }

  Future restoreOption(String key) async {
    var db = await openDatabase(NXHelp.dbName);
    List<Map> list = await db.rawQuery(
        'SELECT * FROM config WHERE key=? ORDER BY id DESC limit 1', [key]);
    return list;
  }

  @override
  void initState() {
    super.initState();
    restoreOption("movingtext_top").then((value) {
      if (value.length >= 1) {
        setState(() {
          _velocity = double.parse(value[0]['val']);
        });
      }
    });

    restoreOption("movingtext_bottom").then((value) {
      if (value.length >= 1) {
        setState(() {
          _currentColorSpeed = double.parse(value[0]['val']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(117, 28, 21, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      left: 10,
                      child: MovingText(
                        textContent: "MOVING TEST",
                        isUpper: true,
                        velocity: _velocity,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("val: $_velocity"),
            Slider(
                value: _velocity,
                onChanged: (curV) async {
                  await saveOption("movingtext_top", curV.toString());

                  setState(() {
                    _velocity = curV;
                  });
                },
                min: 0.0,
                max: 100.00,
                activeColor: Color.fromRGBO(117, 28, 21, 1)),
            Text(
                "When changing the slider it takes a few moments to reflect because of how the animation works. Your preferences are automatically saved"),
            Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  TicketColor(
                    ctx: context,
                    speed: _currentColorSpeed,
                  ),
                  Positioned(
                    top: 60,
                    left: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 0),
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Nxsig(
                            isRounded: false,
                            state: "test oc",
                            company: "pie company",
                            isBottomRounded: true,
                            ticketType: "we",
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text("val: $_currentColorSpeed"),
            Slider(
                onChanged: (newv) async {
                  await saveOption("movingtext_bottom", newv.toString());
                  setState(() {
                    _currentColorSpeed = newv;
                  });
                },
                min: 500,
                max: 2000,
                value: _currentColorSpeed,
                activeColor: Color.fromRGBO(117, 28, 21, 1)),
            Text(
                "Changes are reflected instanty, as its custom coded by me (:- ps your changes are saved slide right for slow slide left for fast"),
          ],
        ),
      ),
    );
  }
}

class AnimationOverlay {
  void onChangeSliderSpeed(a) {}

  void display(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
                child: Column(
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Text(
                    "Tweak NXBUS Animation settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: AnimationOverlayContent()),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(110),
                      border: Border.all(
                          color: Color.fromRGBO(117, 28, 21, 1), width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: IconButton(
                    color: Color.fromRGBO(117, 28, 21, 1),
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )),
          );
        });
  }
}
