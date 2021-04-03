import 'package:BubbleGum/piHome.dart';
import 'package:flutter/material.dart';

import 'package:animated_text/animated_text.dart';
import 'package:cube_transition/cube_transition.dart';
import 'package:page_transition/page_transition.dart';

import 'v2/helper/NxHelp.dart';
import 'v2/pages/nxfront.dart';
import 'v2/pages/ticketv2.dart';

class StartScreenSetup extends StatefulWidget {
  @override
  _StartScreenSetupState createState() => _StartScreenSetupState();
}

class _StartScreenSetupState extends State<StartScreenSetup> {
  var idO;

  AnimatedTextController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimatedTextController.play;
    NXHelp().runInit().then((value) {
      print("imported");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedText(
          alignment: Alignment.center,
          speed: Duration(milliseconds: 1000),
          controller: _controller,
          displayTime: Duration(milliseconds: 100),
          wordList: ['BubbleGUM.', 'V5.', '.'],
          textStyle: TextStyle(
              color: Colors.white, fontSize: 55, fontWeight: FontWeight.w700),
          onAnimate: (index) {
            print("$index");
            if (index == 2) {
              setState(() {
                _controller = AnimatedTextController.stop;
              });

              Future.delayed(Duration(milliseconds: 1), () {
                //lets load up the logic

                // NXHelp aconfig = NXHelp();
                // aconfig.loadConfig("defaulthomepage", 1).then((value) {
                //   if (value.length == 0) {
                //     return;
                //   } else {
                //     //=1;
                //     var currentval = value[0]['val'];
                //     if (currentval == "home") {
                //       //home page
                //       //do nothing it should open up
                //     } else if (currentval == "nxhome") {
                //       Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(builder: (context) => Nxfront()),
                //         (Route<dynamic> route) => false,
                //       );
                //     } else if (currentval == "ticket") {
                //       //goes directly to the default ticket page
                //       NXHelp().buyAndActivateDefaultTicket().then((id) {
                //         setState(() {
                //           idO = id;
                //         });
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) =>
                //                     ActualTicket(txid: id['ticketid'])));
                //       });
                //     }
                //   }
                // });

                Widget h=PiHome();
                
                Navigator.push(
                    context, PageTransition(child: h,duration: Duration(seconds: 1),type:PageTransitionType.downToUp,alignment: Alignment.topCenter));
              });
            }
          },
          onFinished: () {
            print("finished");
            //  Navigator.pop(context);

            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PiHome()));
          },
        ),
      ),
    );
  }
}
