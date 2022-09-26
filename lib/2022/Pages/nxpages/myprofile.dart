import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/form/NXFormInput.dart';


class MyProfile extends StatefulWidget{
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {


  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(169, 26, 25, 1),
      body: Column(
        children: [
           Container(
                width: double.infinity,
                height: 70,
                color: Colors.transparent,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      right: 0,
                      top: 35,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Positioned(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                Icon(Icons.close,
                                size: 28,
                                color: Colors.white.withOpacity(0.95),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 40,
                    child: Text("My profile",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  )
                ])),
                Container(
                  height: 50,
                  color: Color.fromRGBO(139, 0, 8, 1),
                  child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text("Log in",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: isLogin == false ? Colors.white : Colors.black
                            ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: isLogin == false ? Color.fromRGBO(139, 0, 8, 1): Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                      
                            )
                          ),
                        ),
                      ),
                    ),
                     Expanded(
                      child: GestureDetector(
                        onTap: () {
                            setState(() {
                            isLogin = false;
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text("New Account",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: isLogin == true ? Colors.white : Colors.black
                            ),
                            ),
                          ),
                          color: isLogin == true ? Color.fromRGBO(139, 0, 8, 1): Colors.white,
                        ),
                      ),
                    )
                  ],),
                ),
          Expanded(
            child:Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      NXFormInputComponent(
                        label: "Email",
                        tip: "",
                        validator: (String val){
                          if(val.length<=5){
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}