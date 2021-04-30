import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvancedSetupPage extends StatefulWidget {
  @override
  _AdvancedSetupPageState createState() => _AdvancedSetupPageState();
}


class DefHome{
  String pageName;
  String pageid;
  DefHome({
    @required this.pageName
  });
}


class _AdvancedSetupPageState extends State<AdvancedSetupPage> {


  bool isDisclaimer=false;

  List<DefHome> allPageOptions;

  @override
  void initState() {
    allPageOptions= new List();

    allPageOptions.add(DefHome(
      pageName: "Home"
    ));
    allPageOptions.add(DefHome(
      pageName: "NX Home"
    ));
    allPageOptions.add(DefHome(
      pageName: "Ticket"
    ));

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
                            isDisclaimer=val;
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
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: PopupMenuButton(
              color: Colors.yellowAccent,
              child: Text(
                "Set Default Home Page",
                style: GoogleFonts.roboto(fontSize: 25),
              ),
              initialValue: 0,
              onSelected: (selected) {
                print(selected);
              },
              onCanceled: () {
                print("9");
              },
              itemBuilder: (context) {
                return List.generate(allPageOptions.length, (index) {
                  return PopupMenuItem(value: index, child: Text(
                    allPageOptions[index].pageName,
                    style: GoogleFonts.roboto(),
                  ));
                });
              },
            ),
            height: 100,
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: []),
          ),
        )
      ],
    );
  }
}
