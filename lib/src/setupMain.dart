import 'package:bubble_gum/piHome.dart';
import 'package:flutter/material.dart';

import 'package:animated_text/animated_text.dart';
import 'package:page_transition/page_transition.dart';

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
          wordList: ["V6", "..."],
          textStyle: TextStyle(
              color: Colors.white, fontSize: 55, fontWeight: FontWeight.w700),
          onAnimate: (index) {
            print("$index");
            if (index == 1) {
              setState(() {
                _controller = AnimatedTextController.stop;
              });

              Future.delayed(Duration(milliseconds: 1), () {
                //lets load up the logic

                Widget h = PiHome();

                Navigator.push(
                    context,
                    PageTransition(
                        child: h,
                        duration: Duration(seconds: 1),
                        type: PageTransitionType.bottomToTop,
                        alignment: Alignment.topCenter));
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
