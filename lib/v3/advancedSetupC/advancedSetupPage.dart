import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/defaultHomePageModel.dart';
import 'package:BubbleGum/v2/models/ejectionSettingModel.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/advancedSetupC/dialogs/defHomeDialog.dart';
import 'package:BubbleGum/v3/advancedSetupC/dialogs/ejectionSettingDialog.dart';
import 'package:BubbleGum/v3/advancedSetupC/dialogs/pickDefTicketDialog.dart';
import 'package:BubbleGum/v3/advancedSetupC/options/defaultHomePageOption.dart';
import 'package:BubbleGum/v3/advancedSetupC/options/ejectionSettingOption.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'options/defaultTicketOption.dart';

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
  List<DefHome> allPageOptions;
  int defaultHomeIndex = 0;
  int defaultTicketID;

  //controls the disclaimer options
  bool isDisclaimer = false;

  

 

  //controls the set ejection settings
  String defaultEjectionID;

  @override
  void initState() {
    //load default home pref

    SharedPreferences.getInstance().then((value) {
    
      if (value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY) != null) {
        setState(() {
          defaultEjectionID =
              value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY);
        });
      }

       

      int def = value.getInt("default_home");
      if (def != null) {
        setState(() {
          defaultHomeIndex = def;
        });
      }

      bool isDis = value.getBool(SettingsPrefKeys.DISCLAIMER_KEY);

      if (isDis != null) {
        setState(() {
          isDisclaimer = isDis;
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
    return SingleChildScrollView(
          child: Column(
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
                style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.topLeft,
            child: Text(
              "Setup with a brand new intuitive layout, set the default ticket, ejection mode and much more.",
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.yellowAccent,
              ),
              height: 150,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                                child: Text(
                          "Please understand this clone app is for educational purposes only!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ))),
                        Container(
                          child: Column(
                            children: [
                              Switch(
                            inactiveTrackColor: Colors.redAccent,
                            value: isDisclaimer,
                            onChanged: (val) {
                              SharedPreferences.getInstance().then((value) {
                                value.setBool("setup_disclaimer", val);
                                //set the value
                              });

                              setState(() {
                                isDisclaimer = val;
                              });
                            },
                            inactiveThumbColor: Colors.white,
                            activeColor: Colors.redAccent,
                          ),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ],
              )),
          
          DefaultHomePageOption(
            isDisclaimer: isDisclaimer,
          ),
          SizedBox(
            height: 10,
          ),
          defaultTicketOption(
            isDisclaimer: isDisclaimer,
          ),
         
          SizedBox(
            height: 10,
          ),

          EjectionSetOption(
            isDisclaimer: isDisclaimer,
          )
         
        ],
      ),
    );
  }
}





