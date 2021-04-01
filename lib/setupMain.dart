import 'package:BubbleGum/piHome.dart';
import 'package:flutter/material.dart';

import 'package:animated_text/animated_text.dart';
import 'package:cube_transition/cube_transition.dart';

import 'v2/helper/NxHelp.dart';

class StartScreenSetup extends StatefulWidget {
  @override
  _StartScreenSetupState createState() => _StartScreenSetupState();
}

class _StartScreenSetupState extends State<StartScreenSetup> {
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
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedText(
          alignment: Alignment.center,
          speed: Duration(milliseconds: 1000),
          controller: _controller,
          displayTime: Duration(milliseconds: 400),
          wordList: ['BubbleGUM.', 'V5.', '.'],
          textStyle: TextStyle(
              color: Colors.black, fontSize: 55, fontWeight: FontWeight.w700),
          onAnimate: (index) {
            if (index == 2) {
              setState(() {
                _controller = AnimatedTextController.stop;
              });

              Future.delayed(Duration(seconds: 1), () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>PiHome()));
              });
            }
          },
          onFinished: () {
            //  Navigator.pop(context);

            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PiHome()));
          },
        ),
      ),
    );
  }
}
