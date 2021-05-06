import 'dart:async';

import 'package:BubbleGum/main.dart';
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
import 'package:flutter/services.dart';
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


  bool isReadySetup=false;


  /**
   * the boolean checksums to confirm whats been done
   */
  bool defHome=false;
  bool defTicket=false;
  bool defEjection=false;


  Timer mainTimer;



  @override
  void dispose() {
    mainTimer.cancel();
    super.dispose();
  }
  
  


  @override
  void initState() {
    //load default home pref


    mainTimer= Timer.periodic(Duration(seconds: 1), (timer) {

      //check 

      print(defHome);
      print(defTicket);
      print(defEjection);

      if(defHome && defTicket && defEjection){
        if(isDisclaimer){
        setState(() {
          isReadySetup=true;
          mainTimer.cancel();
        });
        }
      }

     });

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
              "The clone requires you to firstly agree with the Legal disclaimer that you will not use the app for any illegal purposes. Also you will be prompted to set your default ticket, home page and ejection settings.\n\nBy Clicking I accept button below you agree to use this app in a legal manner (educational purposes) and do not try and pass the app to a real Bus/ Bus drivers",
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
            ),
          ),
        isDisclaimer!=true ?  Column(
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
                        color:Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                      onPressed: (){
                        SharedPreferences.getInstance().then((value) {
                              value.setBool("setup_disclaimer", true);
                              //set the value
                            });
                        print("Accept Disclaimer");
                        setState(() {
                          isDisclaimer=true;
                        });
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
                        color:Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      
                      ),
                      color: Colors.redAccent,
                      onPressed: (){
                        print("i do not accept");
                        SystemNavigator.pop();
                      },
                    ),
                  ),
                  SizedBox(width: 30,),
                ],
              )
                ,
                SizedBox(height: 20,),
              Text("V6 IS HERE. The best clone in the world. Wanna find out more. Then accept the disclaimer.",
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              )
            ],
          ):Column(
            children: [
              Text("We"),
              SizedBox(height: 40,),

              Text("(Now just click on the yellow buttons to set your default home, default ticket and ejection settings.)",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18
              ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 20,),

              
            ],
          ),
          DefaultHomePageOption(
            onDone: (){
              print("default home page is done");
              setState(() {
                defHome=true;
              });
            },
            isDisclaimer: isDisclaimer,
          ),
          SizedBox(
            height: 10,
          ),
          defaultTicketOption(
            onDone: (){
              setState(() {
                defTicket=true;
              });
            },
            isDisclaimer: isDisclaimer,
          ),
          SizedBox(
            height: 10,
          ),
          EjectionSetOption(
            isDisclaimer: isDisclaimer,
            onDone: (){
              setState(() {
                defEjection=true;
              });
            },
          )
        ,
        SizedBox(
          height: 20,
        ),
       isReadySetup!=true ? Container(): RaisedButton(
          color: Colors.yellowAccent,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(20)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Continue",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          ),
          SizedBox(width: 20,),
          Icon(Icons.check,color: Colors.black,
          size: 20,
          )
            ],
          ),
          onPressed: (){
            print("continue");

            

            SharedPreferences.getInstance().then((pref) {
              pref.setBool(SettingsPrefKeys.START_UP_SETUP, true);
              //flag first time setup is completed
            });
            Navigator.push(context, MaterialPageRoute(
              builder: (ctx)=>HomePagePre()
            ));
          },
        )
        
        ],
      ),
    );
  }
}
