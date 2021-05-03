import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/defaultHomePageModel.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/advancedSetupC/dialogs/defHomeDialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultHomePageOption extends StatefulWidget {
  final bool isDisclaimer;

  DefaultHomePageOption({@required this.isDisclaimer});

  @override
  _DefaultHomePageOptionState createState() => _DefaultHomePageOptionState();
}

class _DefaultHomePageOptionState extends State<DefaultHomePageOption> {
  //controls the default home option
  String defHomeID;
  String defHomeName;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.getString(SettingsPrefKeys.DEFAULT_HOME__PAGE_KEY) != null) {
        setState(() {
          defHomeID = value.getString(SettingsPrefKeys.DEFAULT_HOME__PAGE_KEY);

          defHomeName = NXHelp().getDefHomeOptionById(defHomeID).name;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isDisclaimer == null || widget.isDisclaimer == false
            ? Container()
            : GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => DefHomePageDialog(
                            onSelectDefHome: (val) {
                              print("Selected home page $val");

                              SharedPreferences.getInstance()
                                  .then((sharedpref) {
                                sharedpref.setString("def_home_adv", val);

                                setState(() {
                                  defHomeID = val;
                                  defHomeName =
                                      NXHelp().getDefHomeOptionById(val).name;
                                });
                                Navigator.pop(context);
                              });

                              DefHomePageModel p =
                                  NXHelp().getDefHomeOptionById(val);
                              print(p.name);
                            },
                          ));
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Set Default Home Page",
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "(" + defHomeName.toString() + ")",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  height: 80,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          blurRadius: 4,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ]),
                ),
              ),
      ],
    );
  }
}
