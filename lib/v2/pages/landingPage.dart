import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nxclone/v2/components/fancyOptions.dart';
import 'package:nxclone/v2/main/bar.dart';
import 'package:sqflite/sqflite.dart';


class LandingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LandingPageState();
  }

}

class LandingPageState extends State<LandingPage>{

    FancyOptions option1;
    FancyOptions option2;

    bool isShowing=true;


     saveOption(String key,String val) async {
      var db= await openDatabase("main.db");
      db.execute("CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
     var iid= await db.rawInsert("INSERT INTO config(key, val) VALUES(?, ?)",[key,val]);
     print(iid);
     return iid;
    }

   Future restoreOption(String key) async {
        var db= await openDatabase("main.db");
        List<Map> list = await db.rawQuery('SELECT * FROM config WHERE key=? ORDER BY id DESC limit 1',[key]);
        return list;
    }


    resetState() async {
      setState(() {
              isShowing=false;
            });
      await new Future.delayed(const Duration(milliseconds : 100));
            setState(() {
              isShowing=true;
            });
    }


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    option1= FancyOptions(title: "Home Page",isSelected: true,assetRoute:"images/home1.png" ,clicked: () async {
                this.saveOption("defaulthomepage", "home");
            setState(() {
              option2.isSelected=false;
              option1.isSelected=true;   
              isShowing=false;               
            });
             resetState();
          },
          boxFitt: BoxFit.cover,
          );

        option2=  FancyOptions(title: "Ticket only",isSelected: false,assetRoute:"images/home2.png",clicked: ()async {

             this.saveOption("defaulthomepage", "ticket");
            
            setState(() {
              option1.isSelected=false;
            option2.isSelected=true;  
            isShowing=false;
             });
              resetState();
          },boxFitt: BoxFit.cover,);

        restoreOption("defaulthomepage").then((value) {

            if(value.length==0){

            }else{

            if(value[0]['val']=="home"){
              print("home page");
              option2.isSelected=false;
              option1.isSelected=true;  
            }else{
              option1.isSelected=false;
              option2.isSelected=true;  
            }

         resetState();
            }


        });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: BarV2(),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
             child: Text("Set default page",
          textAlign: TextAlign.center,
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ) ,
          ),
          ),
          SizedBox(height: 10,),
          Text("---"),
          SizedBox(height: 20,),
        isShowing==true?  option1.createElement().widget:Container(),
          SizedBox(height: 20,),
         isShowing==true ? option2.createElement().widget: Container()
        ],
      )
    );
  }

}