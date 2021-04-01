import 'package:flutter/material.dart';

import 'package:animated_text/animated_text.dart';

import 'v2/helper/NxHelp.dart';

class StartScreenSetup extends StatefulWidget{
  @override
  _StartScreenSetupState createState() => _StartScreenSetupState();
}

class _StartScreenSetupState extends State<StartScreenSetup> {

  @override
  void initState() {
    super.initState();
     NXHelp().runInit().then((value) {
      print("imported");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedText(
                alignment: Alignment.center,
                speed: Duration(milliseconds: 1000),
                controller: AnimatedTextController.play,
                displayTime: Duration(milliseconds: 1000),
                wordList: ['BubbleGum.', 'V5.', 'has.', 'arrived.',"Enjoy."],
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.w700),
                    onAnimate: (index) {
                print("Animating index:" + index.toString());
                },
                 onFinished: () {
                  print("Animtion finished");
                },
              ),
      ),
    );
  }
}