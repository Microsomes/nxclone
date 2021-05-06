import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/ejectionSettingModel.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/advancedSetupC/dialogs/ejectionSettingDialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EjectionSetOption extends StatefulWidget {
  final bool isDisclaimer;
  final Function onDone;

  EjectionSetOption({@required this.isDisclaimer,
  @required this.onDone
  });

  @override
  _EjectionSetOptionState createState() => _EjectionSetOptionState();
}

class _EjectionSetOptionState extends State<EjectionSetOption> {
  //controls the set ejection settings
  String defaultEjectionID;
  String ejectionName;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY) != null) {
        setState(() {
          defaultEjectionID =
              value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY);

          ejectionName =
              NXHelp().getEjectionSettingByID(defaultEjectionID).name;
        });

        widget.onDone();
        //sets message to parent say its done
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
                  print("set default ticket");

                  showDialog(
                      context: context,
                      builder: (ctx) => SetEjectionSettings(
                            onSelectEjection: (eectionid) {
                              EjectionSettingModel ej =
                                  NXHelp().getEjectionSettingByID(eectionid);
                              SharedPreferences.getInstance().then((sharePref) {
                                sharePref.setString(
                                    "ejected_setting_adv", ej.id);
                                setState(() {
                                  defaultEjectionID = ej.id;
                                  ejectionName = NXHelp()
                                      .getEjectionSettingByID(defaultEjectionID)
                                      .name;
                                });
                                        widget.onDone();


                                Navigator.pop(context);
                              });
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
                          "Ejection Settings",
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      defaultEjectionID != null
                          ? Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "(" + ejectionName + ")",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          : Container()
                    ],
               
                  ),
                  height: 80,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          blurRadius: 4,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ]),
                ),
              )
      ],
    );
  }
}
