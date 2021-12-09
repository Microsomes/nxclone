import 'package:bubble_gum/data/nxbus/nxdb.dart';
import 'package:bubble_gum/src/setupMain.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/models/sharedprefkey/main.dart';
import 'package:bubble_gum/src/v2/pages/nxfront.dart';
import 'package:bubble_gum/src/v2/pages/ticketv2.dart';
import 'package:bubble_gum/src/v3/newSetup.dart';
import 'package:bubble_gum/src/v7/afterDisclaimerQuickMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'data/nxbus/modules/nx_tickets.dart';

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
            return Nxfront();
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
