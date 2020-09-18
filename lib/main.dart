import 'package:BlackPie/piHome.dart';
import 'package:BlackPie/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/main/quickOptions.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagePrestate();
  }
}

class HomePagePrestate extends State<HomePagePre>
    with SingleTickerProviderStateMixin {
  bool isShowing = false;
  double maxHeight;
  double containerHeight;

  var idO;

  double skeletonOpacity = 0;

  double sizeOfBottomBar = 0;

  Timer mainTimer;

  var nxhometop2 = 200;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    NXHelp().runInit();
    NXHelp().deleteAllTickets();
    //run the init process
    //NXHelp().runScan();

    
    

    NXHelp().buyAndActivateDefaultTicket().then((id) {
      setState(() {
        idO = id;
      });
    });

    NXHelp aconfig = NXHelp();

    aconfig.loadConfig("defaulthomepage", 1).then((value) {
      if (value.length == 0) {
        return;
      } else {
        //=1;
        var currentval = value[0]['val'];
        if (currentval == "home") {
          //home page

          

        } else if (currentval == "nxhome") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Nxfront()),
            (Route<dynamic> route) => false,
          );
        } else if (currentval == "ticket") {
          //goes directly to the default ticket page
          NXHelp().buyAndActivateDefaultTicket().then((id) {
            setState(() {
              idO = id;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ActualTicket(txid: id['ticketid'])));
          });
        }
      }
    });

    //maxHeight= MediaQuery.of(context).size.height;
    containerHeight = 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PiHome();
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));
  return runApp(Phoenix(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        home: HomePagePre()

        //Halifax()

        //MainLauncher()
        //HomePagePre(),
        //home:PaymentConfirmed()
        ),
  ));
}
