import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:flutter/material.dart';
import 'package:bubble_gum/src/v2/components/fancyOptions.dart';
import 'package:bubble_gum/src/v2/main/bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';

class Ejection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EjectionState();
  }
}

class EjectionState extends State<Ejection> {
  List ejectionOptions = [];

  bool isShowing = true;

  @override
  void initState() {
    super.initState();
    ejectionOptions.add({
      "title": "Crash App",
      "icon": Icons.settings,
      "asset": "images/crash.png",
      "id": "crash",
      "selected": false,
    });
    ejectionOptions.add({
      "title": "Launch Real App",
      "icon": Icons.settings,
      "asset": "images/launch.png",
      "id": "launchapp",
      "selected": false
    });
    ejectionOptions.add({
      "title": "Fake Error",
      "icon": Icons.settings,
      "asset": "images/error.png",
      "id": "fakeerror",
      "selected": false
    });
    restoreOption("ejection").then((value) {
      if (value.length == 0) {
        //do nothing
      } else {
        var current = value[0]['val'];
        ejectionOptions.forEach((element) {
          if (element['id'] == current) {
            element['selected'] = true;
          } else {
            element['selected'] = false;
          }
        });
        resetState();
      }
    });
  }

  saveOption(String key, String val) async {
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

  resetState() async {
    setState(() {
      isShowing = false;
    });
    await new Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      isShowing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: BarV2(),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text("Ejection Settings",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Act Accordingly",
              style: GoogleFonts.acme(color: Colors.white),
            ),
            isShowing == true
                ? Expanded(
                    child: ListView.builder(
                        itemCount: ejectionOptions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FancyOptions(
                              title: ejectionOptions[index]['title'],
                              isSelected: ejectionOptions[index]['selected'],
                              assetRoute: ejectionOptions[index]['asset'],
                              clicked: () {
                                var id = ejectionOptions[index]['id'];
                                saveOption("ejection", id);
                                restoreOption("ejection").then((value) {
                                  if (value.length == 0) {
                                    //do nothing
                                  } else {
                                    var current = value[0]['val'];
                                    ejectionOptions.forEach((element) {
                                      if (element['id'] == current) {
                                        element['selected'] = true;
                                      } else {
                                        element['selected'] = false;
                                      }
                                    });
                                    resetState();
                                  }
                                });
                              },
                              boxFitt: BoxFit.fill,
                            ),
                          );
                        }),
                  )
                : Container()
          ],
        ));
  }
}
