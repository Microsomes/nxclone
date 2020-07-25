import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/main/bar.dart';
import 'package:BlackPie/v2/main/quickOptions.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagePre_state();
  }
}

class HomePagePre_state extends State<HomePagePre> {
  bool isShowing = false;
  double maxHeight;
  double containerHeight;

  @override
  void initState() {
    super.initState();

    NXHelp aconfig = NXHelp();
    aconfig.loadConfig("defaulthomepage", 1).then((value) {
      if (value.length == 0) {
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
    // TODO: implement build

    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
            child: BarV2(), preferredSize: const Size.fromHeight(45)),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Column(children: [
                Container(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Pie=mx+c",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("open ticket page");

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Nxfront()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 120,
                            width: 120,
                            child: Image.asset(
                              "images/mrskeleton.png",
                              width: 200,
                            )),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.lightGreen,
                        offset: new Offset(2.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: QuickOptions(),
                )
              ]),
            ),
            isShowing == true
                ? Container(
                    height: containerHeight,
                    color: Colors.white,
                  )
                : Container(),
          ],
        )));
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
      home: HomePagePre(),
      //home:PaymentConfirmed()
    ),
  ));
}
