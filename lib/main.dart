import 'package:BubbleGum/piHome.dart';
import 'package:BubbleGum/setupMain.dart';
import 'package:BubbleGum/v3/newSetup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
    /**
     * This init code runs everytime the app opens
     * it creates the database of tickets and inits everything
     */
    /**
     * Since we had a bug with the ticket wallet, on boot
     * i also delete all pending tickets, if i didnt add this then 
     * we would run in the memory leak
     */
    //NXHelp().deleteAllTickets();
    //run the init process
    //NXHelp().runScan();

    /**
     * This code buys the default ticket, its more of a convenience 
     * so the user doesnt have to buy the real app themselves everytime
     * they open up the app
     */
    // NXHelp().buyAndActivateDefaultTicket().then((id) {
    //   setState(() {
    //     idO = id;
    //   });
    // });
    /**
     * this grabs the config settings so we can determine 
     * which page to boot too
     */
    
    //maxHeight= MediaQuery.of(context).size.height;
    containerHeight = 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context,data){

        if(data.connectionState==ConnectionState.waiting){
          return Text("Waiting...");
        }

        SharedPreferences sh= data.data;
        if(sh.getInt(SharedPrefKeys.setupKey)==null){
          return NewSetupv3();
        }else{
         return StartScreenSetup();
        }
      },
    );
  }
}

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
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
        ),
  ));
}