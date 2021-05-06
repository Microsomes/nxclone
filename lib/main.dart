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

import "./debug/ticketWalletDebug.dart";

import 'pages/journey/ticket.dart';
import 'v2/models/sharedprefkey/main.dart';
import 'v2/pages/ticket.dart';

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

    NXHelp().runInit();

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
      builder: (context, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ));
        }

        //  NXHelp().buyTicketv2(ticketID: 2,tag: "MAN_BUY").then((value) {
        //    print(value);
        //  });

        // NXHelp().getAllUseableTicketsv2().then((value) {
        //   print(value);
        // });

        // NXHelp().activeTicketv2(id: 9).then((value) {
        //   print(value);
        // });

          return TicketDebug();

           return Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder(
              future: NXHelp().getAllActiveTicketsV2(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 
                  return CircularProgressIndicator();
                 } else {
                List<Map> all=snapshot.data;

                  return Column(
                    children: [
                      
                      Expanded(
                                              child: Container(
                          height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: all.length,
                        itemBuilder: (ctx, index) {
                          return FutureBuilder(
                            future: NXHelp().getTicketByID(all[index]['ticketid']),
                            builder: (ctx,snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }else{
                              
                              return ListTile(
                                onTap: (){
                                  //activate ticket

                                  NXHelp().activeTicketv2(id: all[index]['id']).then((value) {
                                    print(">"+value.toString());
                                  });

                                },
                                leading: CircleAvatar(

                                  child: Text(all[index]['id'].toString()),
                                ),
                            title:  Text(snapshot.data[0]['tickettitle']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(snapshot.data[0]['state']),
                              Text("Purchase Date:\n"+all[index]['created']),
                              all[index]['activeStatus']== -1 ? Text("Not activated") : Text("Activated")
                              
                            ],),
                          );
                              }
                            },
                          );
                        },
                    ),
                  ),
                      )
                    ],
                  );
                }
              },
            ));

        return Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder(
              future: NXHelp().getAllUseableTicketsv2(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 
                  return CircularProgressIndicator();
                 } else {
                List<Map> all=snapshot.data;

                  return Column(
                    children: [

                      Expanded(
                                              child: Container(
                          height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: all.length,
                        itemBuilder: (ctx, index) {
                          return FutureBuilder(
                            future: NXHelp().getTicketByID(all[index]['ticketid']),
                            builder: (ctx,snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }else{
                              
                              return ListTile(
                                onTap: (){
                                  //activate ticket

                                  NXHelp().activeTicketv2(id: all[index]['id']).then((value) {
                                    print(">"+value.toString());
                                  });

                                },
                                leading: CircleAvatar(

                                  child: Text(all[index]['id'].toString()),
                                ),
                            title:  Text(snapshot.data[0]['tickettitle']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(snapshot.data[0]['state']),
                              Text("Purchase Date:\n"+all[index]['created']),
                              all[index]['activeStatus']== -1 ? Text("Not activated") : Text("Activated")
                              
                            ],),
                          );
                              }
                            },
                          );
                        },
                    ),
                  ),
                      )
                    ],
                  );
                }
              },
            ));

        return Text("....");

        SharedPreferences sh = data.data;
        if (sh.getBool(SettingsPrefKeys.START_UP_SETUP) == null) {
          return NewSetupv3();
        } else {
          var defaultHomePage =
              sh.getString(SettingsPrefKeys.DEFAULT_HOME__PAGE_KEY);
          print(defaultHomePage);

          if (defaultHomePage == "non_sim_home") {
            return StartScreenSetup();
          } else if (defaultHomePage == "sim_home") {
            return Nxfront();
          } else {
            return FutureBuilder(
              future: NXHelp().buyAndActivateDefaultTicket(),
              builder: (ctx, snapshot) {
                if (snapshot.data != null) {
                  var ticketid = snapshot.data['ticketid'];

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

void main() async {
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
        home: HomePagePre()),
  ));
}
