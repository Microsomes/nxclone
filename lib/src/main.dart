import 'package:bubble_gum/setupMain.dart';
import 'package:bubble_gum/splash.dart';
import 'package:bubble_gum/v3/newSetup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bubble_gum/v2/helper/NxHelp.dart';
import 'package:bubble_gum/v2/pages/nxfront.dart';
import 'package:bubble_gum/v2/pages/ticketv2.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'v2/models/sharedprefkey/main.dart';
import 'v7/afterDisclaimerQuickMenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));

  NXHelp().runInit();

  runApp(Phoenix(
      child: FutureBuilder(
    future: Future.delayed(Duration(seconds: 3)),
    builder: (ctx, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return MaterialApp(
          home: Splash(),
          debugShowCheckedModeBanner: false,
        );
      } else {
        // Loading is done, return the app:
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              textTheme: GoogleFonts.robotoTextTheme(),
            ),
            home: HomePagePre());
      }
    },
  )));
}

class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagePrestate();
  }
}

class HomePagePrestate extends State<HomePagePre>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ));
        }

        SharedPreferences sh = data.data;

        if (sh.getBool(SettingsPrefKeys.startUpSetup) == null) {
          if (sh.getBool(SettingsPrefKeys.setupDisclaimer) == true) {
            //if disclaimer is true move on to a new quick menu
            return AfterDisclaimer();
          } else {
            return NewSetupv3();
          }
        } else {
          var defaultHomePage = sh.getString(SettingsPrefKeys.disclaimerKey);
          print(defaultHomePage);

          if (defaultHomePage == "non_sim_home") {
            return StartScreenSetup();
          } else if (defaultHomePage == "sim_home") {
            return Nxfront();
          } else {
            return FutureBuilder(
              future: NXHelp().buyDefaultTicketAndActivatev2(),
              builder: (ctx, snapshot) {
                if (snapshot.data != null) {
                  var ticketid = snapshot.data;

                  return ActualTicket(
                    txid: ticketid,
                  );
                } else {
                  return Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                }
              },
            );
          }
        }
      },
    );
  }
}
