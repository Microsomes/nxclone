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
                "First time Setup",
                style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.topLeft,
            child: Text(
              "The clone requires you to firstly agree with the Legal disclaimer that you will not use the app for any ilegal purposes. Also you will be prompted to set your default ticket, home page and ejection settings.\n\nBy Clicking I accept button below you agree to use this app in a legal manner (educational purposes) and do not try and pass the app to a real Bus/ Bus drivers",
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
            ),
          ),
          Column(
            children: [
              Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellowAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellowAccent,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
              height: 150,
              child: Stack(children: [
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Please understand this clone app is for educational purposes only!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, 
                          fontSize: 15),
                    ))
              ])),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30,),
                  Expanded(
                                      child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.greenAccent,
                      child: Text("I Accept",style: GoogleFonts.roboto(
                        color:Colors.black
                      ),),
                      onPressed: (){
                        print("Accept Disclaimer");
                      },
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                                      child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("I Do Not Accept",
                      style: GoogleFonts.roboto(
                        color:Colors.black
                      ),
                      
                      ),
                      color: Colors.redAccent,
                      onPressed: (){
                        print("i do not accept");
                      },
                    ),
                  ),
                  SizedBox(width: 30,),
                ],
              )

            ],
          ),
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
