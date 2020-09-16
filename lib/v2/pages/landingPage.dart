import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:BlackPie/v2/components/fancyOptions.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/main/bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';

class LandingPage extends StatefulWidget {
  final bool shallRestart;

  LandingPage({this.shallRestart = true});

  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  FancyOptions option1;
  FancyOptions option2;
  FancyOptions option3;

  bool isShowing = true;

  Future saveOption(String key, String val) async {
    var db = await openDatabase(NXHelp.DB_NAME);
    db.execute(
        "CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
    var iid = await db
        .rawInsert("INSERT INTO config(key, val) VALUES(?, ?)", [key, val]);
    return iid;
  }

  Future restoreOption(String key) async {
    var db = await openDatabase(NXHelp.DB_NAME);
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
  void initState() {
    super.initState();

    NXHelp();

    option1 = FancyOptions(
      title: "BlackPie Home",
      isSelected: true,
      assetRoute: "images/home1.png",
      clicked: () async {
        await this.saveOption("defaulthomepage", "home");
        if (widget.shallRestart) {
          Phoenix.rebirth(context);
        } else {
          setState(() {
            option2.isSelected = false;
            option1.isSelected = true;
            isShowing = false;
          });
          resetState();
        }
      },
      boxFitt: BoxFit.cover,
    );

    option2 = FancyOptions(
      title: "NX Home",
      isSelected: false,
      assetRoute: "images/home2.png",
      clicked: () async {
        await this.saveOption("defaulthomepage", "nxhome");
        if (widget.shallRestart) {
          Phoenix.rebirth(context);
        } else {
          setState(() {
            option1.isSelected = false;
            option3.isSelected = false;
            option2.isSelected = true;
            isShowing = false;
          });
          resetState();
        }
      },
      boxFitt: BoxFit.cover,
    );

    option3 = FancyOptions(
      title: "Ticket only",
      isSelected: false,
      assetRoute: "images/home2.png",
      clicked: () async {
        await this.saveOption("defaulthomepage", "ticket");
        if (widget.shallRestart) {
          Phoenix.rebirth(context);
        } else {
          setState(() {
            option1.isSelected = false;
            option3.isSelected = true;
            option2.isSelected = false;
            isShowing = false;
          });
          resetState();
        }
      },
      boxFitt: BoxFit.cover,
    );

    restoreOption("defaulthomepage").then((value) {
      print(value);
      if (value.length == 0) {
      } else {
        if (value[0]['val'] == "home") {
          option2.isSelected = false;
          option1.isSelected = true;
          option3.isSelected = false;
        } else if (value[0]['val'] == "ticket") {
          option1.isSelected = false;
          option2.isSelected = false;
          option3.isSelected = true;
        } else {
          option2.isSelected = true;
          option1.isSelected = false;
          option3.isSelected = false;
        }

        resetState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: BarV2(),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Set default page",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isShowing == true
                    ? option1.createElement().widget
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                isShowing == true
                    ? option2.createElement().widget
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                isShowing == true ? option3.createElement().widget : Container()
              ],
            ),
          ),
        ));
  }
}
