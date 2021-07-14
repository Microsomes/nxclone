//init and show nx home screen


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'v2/helper/NxHelp.dart';

class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    NXHelp().runInit();//init

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Image.asset("images/screen4.png",
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      ),
    );
  }
}