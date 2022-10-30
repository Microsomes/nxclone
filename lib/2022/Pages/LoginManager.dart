import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../2022helper.dart';

class LoginManager extends StatefulWidget {
  @override
  State<LoginManager> createState() => _LoginManagerState();
}

class _LoginManagerState extends State<LoginManager> {
  final Box = GetStorage();

  bool isLogged = false;

  void CheckLoginStatus(){
    if(Box.read("isLogged") == null){
      setState(() {
        isLogged = false;
      });
    }else{
      setState(() {
        isLogged = true;
      });
    }

    print("isLogged: $isLogged");
  }

  @override
  void initState() {
    super.initState();
    CheckLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Login Manager"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "NX Clone now supports logging in to so you can quickly sign in here, it will reflect when you open the clone",
                      style: GoogleFonts.roboto(
                          fontSize: 17, color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                isLogged == false ? Text("Currently: Not logged in",style: GoogleFonts.roboto(
                    color: Colors.grey
                  ),): Text("Currently: Logged In"),
                  CupertinoButton(child: Text("LogIn to gorilla@hotmail.com"), onPressed: (){
                    NXCreateAccount("gorilla@hotmail.com", "password123");
                    NXLoginAccount("gorilla@hotmail.com", "password123").then((value) {
                      if(value == true){
                        setState(() {
                          isLogged = true;
                        });
                      }
                    });
                  

                    //Toast
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged in to: gorilla@hotmail.com"),));

                    CheckLoginStatus();

                  }),
                  CupertinoButton(child: Text("Logout (if logged in)"), onPressed: (){
                    Box.erase();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged out"),));

                    CheckLoginStatus();
                  })
                ],
              ),
            )
          ],
        ));
  }
}
