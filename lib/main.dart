import 'package:bubble_gum/HomePagePre.dart';
import 'package:bubble_gum/data/nxbus/nxdb.dart';
import 'package:bubble_gum/src/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));

  NXHelp().runInit();

  runApp(Phoenix(
      child: Provider(
    create: (ctx) => NXDatabase(),
    child: getHomeFuture(),
    dispose: (context, db) => db.close(),
  )));
}

Widget getHomeFuture() {
  return FutureBuilder(
    future: Future.delayed(Duration(seconds: 3)),
    builder: (ctx, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return MaterialApp(
          home: Splash(),
          debugShowCheckedModeBanner: false,
        );
      } else {
        // Loading is done, return the app:
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              textTheme: GoogleFonts.robotoTextTheme(),
            ),
            home: HomePagePre());
      }
    },
  );
}
