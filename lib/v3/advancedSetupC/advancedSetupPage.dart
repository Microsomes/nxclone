import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvancedSetupPage extends StatefulWidget {
  @override
  _AdvancedSetupPageState createState() => _AdvancedSetupPageState();
}

class DefHome {
  String pageName;
  int pageid;
  DefHome({@required this.pageName, @required this.pageid});
}

class _AdvancedSetupPageState extends State<AdvancedSetupPage> {
  bool isDisclaimer = false;

  List<DefHome> allPageOptions;

  int defaultHomeIndex = 0;

  @override
  void initState() {
    //load default home pref

    SharedPreferences.getInstance().then((value) {
      int def = value.getInt("default_home");
      if (def != null) {
        setState(() {
          defaultHomeIndex = def;
        });
      }
    });

    allPageOptions = new List();

    allPageOptions.add(DefHome(pageName: "Home", pageid: 0));
    allPageOptions.add(DefHome(pageName: "NX Home", pageid: 1));
    allPageOptions.add(DefHome(pageName: "Ticket", pageid: 2));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              "Advanced Setup",
              style: GoogleFonts.roboto(fontSize: 30),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          alignment: Alignment.topLeft,
          child: Text(
            "Setup with a brand new intuitive layout, set the default ticket, ejection mode and much more.",
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.black),
          ),
        ),
        Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.yellowAccent,
            ),
            height: 80,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              child: Text(
                        "Please understand this clone app is for educational purposes only!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ))),
                      Switch(
                        value: isDisclaimer,
                        onChanged: (val) {
                          setState(() {
                            isDisclaimer = val;
                          });
                        },
                        inactiveThumbColor: Colors.white,
                        activeColor: Colors.greenAccent,
                      )
                    ],
                  ),
                ),
              ],
            )),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: PopupMenuButton(
              color: Colors.yellowAccent,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Set Default Home Page",
                      style: GoogleFonts.roboto(fontSize: 25),
                    ),
                  ),
                  Text(
                    "(" + allPageOptions[defaultHomeIndex].pageName + ")",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              initialValue: defaultHomeIndex,
              onSelected: (selected) {
                setState(() {
                  defaultHomeIndex = selected;
                });
                SharedPreferences.getInstance().then((value) {
                  value.setInt("default_home", selected);
                });
              },
              onCanceled: () {
                print("9");
              },
              itemBuilder: (context) {
                return List.generate(allPageOptions.length, (index) {
                  return PopupMenuItem(
                      value: allPageOptions[index].pageid,
                      child: Text(
                        allPageOptions[index].pageName,
                        style: GoogleFonts.roboto(),
                      ));
                });
              },
            ),
            height: 70,
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
