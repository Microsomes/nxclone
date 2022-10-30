import 'package:BubbleGum/2022/Pages/nxpages/front.dart';
import 'package:BubbleGum/v2/pages/menupage/topMenuPage.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../v2/pages/menupage/profile/LoginIn.dart';

class MyProfileLoggedIn extends StatefulWidget {
  @override
  State<MyProfileLoggedIn> createState() => _MyProfileLoggedInState();
}

class _MyProfileLoggedInState extends State<MyProfileLoggedIn> {
  var loggedInEmail = null;

  final Box = GetStorage();

    var sections = [
    {
      "section": "",
      "links": [
        {
          "type": "link",
          "label": "My Cards",
          "icon": "images/front/account.svg",
          "action": (BuildContext ctx, bool isLoggedIn){

            if(isLoggedIn){
             Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfileLoggedIn()));
            }else{
              Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfile()));
            }
          }
        },
         {
          "type": "link",
          "label": "Change Password",
          "icon": "images/front/account.svg",
          "action": (BuildContext ctx, bool isLoggedIn){

            if(isLoggedIn){
             Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfileLoggedIn()));
            }else{
              Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfile()));
            }
          }
        },
         {
          "type": "link",
          "label": "Delete Account",
          "icon": "images/front/account.svg",
          "action": (BuildContext ctx, bool isLoggedIn){

            if(isLoggedIn){
             Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfileLoggedIn()));
            }else{
              Navigator.push(ctx,MaterialPageRoute(builder: (ctx)=> MyProfile()));
            }
          }
        }
      ]
    }
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      loggedInEmail = Box.read('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "images/front/back.svg",
                                width: 21,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 50,
                  child: Text("My profile",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: Container(
              color: Color.fromRGBO(169, 27, 26, 1),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: UtilitiesList(
                      SpacingTop: false,
                      sections: sections,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              showCupertinoDialog(context: context, builder: (ctx)=> CupertinoAlertDialog(
                content: Column(
                  children: [
                    Text("Log me out",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 10,),
                    Text("If you log out you will not be able to access your tickets or saved payment methods")
                  ],
                  
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text("Cancel",
                    style:GoogleFonts.roboto(
                      color: Color.fromRGBO(114,26, 25, 1)
                    )),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("OK",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    ),
                    onPressed: (){
                      Box.erase();
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> NxPagesFront()));
                    },
                  )
                
                ],
              ));
            },
            child: Container(
              color: Colors.white,
              height: 80,
              child: Container(
                child: Center(
                  child: Text(
                    "Log out $loggedInEmail",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(188, 156, 107, 1),
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 17, bottom: 14),
              ),
            ),
          )
        ],
      )),
    );
  }
}
