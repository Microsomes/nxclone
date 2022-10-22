import 'package:BubbleGum/2022/2022helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '2022/Pages/nxpages/front.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));

  NXHelp().runInit();
  return runApp(Phoenix(
    child: FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (ctx,AsyncSnapshot snapshot){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: NXInitApp(),
            builder: (ctx,snapshot){
              return FutureBuilder(
                future: CheckTicketsForExpiry(),
                builder:(ctx,snapshot)=> NxPagesFront());
            },
          )
        );
      },
    )
  ));
}
