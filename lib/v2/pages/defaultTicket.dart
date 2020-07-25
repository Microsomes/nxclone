import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nxclone/pages/components/singleInactive.dart';
import 'package:nxclone/v2/components/fancyOptions.dart';
import 'package:nxclone/v2/helper/NxHelp.dart';
import '../../components/daysaveractive.dart';
import '../main/bar.dart';
import 'package:nxclone/v2/pages/overlays/defaultTicketOverlay.dart';

import 'package:sqflite/sqflite.dart';


class DefaultTicket extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DefaultTicketState();
  }

}

class DefaultTicketState extends State<DefaultTicket>{

     List ticketOptions=List();
     bool isShowing=false;
     String currentTicketTitle="";


     Map currentTicket=null;


     Timer _timer;

     @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticketOptions.add({"title":"Daysaver","icon":Icons.settings,"asset":"images/daysaver1.png","id":"daysaver","selected":false});
    ticketOptions.add({"title":"Single Journey","icon":Icons.settings,"asset":"images/single1.png","id":"single","selected":false});
    ticketOptions.add({"title":"Daysaver (Sat-Sun)","icon":Icons.settings,"asset":"images/daysaversatsun.png","id":"daysaversatsun","selected":false});
    ticketOptions.add({"title":"Evening Saver after 6pm","icon":Icons.settings,"asset":"images/eveningsaver.png","id":"eveningsaverafter6","selected":false});
    ticketOptions.add({"title":"Group Day Saver","icon":Icons.settings,"asset":"images/groupdaysaver.png","id":"groupdaysaver","selected":false});
    ticketOptions.add({"title":"Group Daysaver after 6pm","icon":Icons.settings,"asset":"images/groupdaysaverafter6.png","id":"groupdaysaverafter6","selected":false});
 

    restoreOption("defaultticket").then((value){
      if(value.length==0){
        //do nothing
      }else{
        var current= value[0]['val'];
        ticketOptions.forEach((element) {
            if(element['id']==current){
              element['selected']=true;
              setState(() {
                currentTicketTitle=element['title'];
              });
            }
        });
        resetState();
      }
    });


    _timer= Timer.periodic(Duration(milliseconds: 100), (timer) {

        NXHelp().loadConfig("deficketv2", 1).then((deftik){
      setState(() {
        currentTicket=deftik[0];
      });
    });
     });
  }
  

 Future restoreOption(String key) async {
        var db= await openDatabase("main.db");
        List<Map> list = await db.rawQuery('SELECT * FROM config WHERE key=? ORDER BY id DESC limit 1',[key]);
        return list;
    }

  saveOption(String key,String val) async {
      var db= await openDatabase("main.db");
      db.execute("CREATE TABLE IF NOT EXISTS config ( id integer  PRIMARY KEY AUTOINCREMENT, key text, val text)");
     var iid= await db.rawInsert("INSERT INTO config(key, val) VALUES(?, ?)",[key,val]);
     print(iid);
     return iid;
    }

    resetState() async {
      setState(() {
              isShowing=false;
            });
      await new Future.delayed(const Duration(milliseconds : 100));
            setState(() {
              isShowing=false;
            });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: BarV2(),
      ),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
            color: Color.fromRGBO(123, 26, 17, 1),
          height: 160,
          child: currentTicket!=null? 


          SingleInactiveTicket(
                              sizeW: MediaQuery.of(context).size.width,
                              ticketType: currentTicket['val'].split(":")[1],
                              state: currentTicket['val'].split(":")[0],
                              txdbid: 1,
                              ticketExpiryDate: "Saved to default",
                            )
          
          
          // ticketTwo(title: currentTicket['val'],id: 1,)
          
          
          :CircularProgressIndicator(),
        ),
        SizedBox(height: 20,),
        Text("Customise Ticket",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Determines the default ticket, that is automatically \npre-activated and purchased for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.lightGreen
          ),
          ),
        ),

        InkWell(
          onTap: (){
            print("select state");
            DefaultTicketOverlay().showDefaultOverlay(context);
          },
                  child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
             child: Center(
               child: Text("Select state",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.w800
               ),),
             )
          ),
        ),

      isShowing==true ?  Expanded(
          child: Center(child: 
          ListView.builder(
            itemCount: ticketOptions.length,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: FancyOptions(
                title: "",
                isSelected: ticketOptions[index]['selected'],
                assetRoute: ticketOptions[index]['asset'],
                clicked: (){
                  saveOption("defaultticket",ticketOptions[index]['id']);
                  restoreOption("defaultticket").then((value){
                  if(value.length==0){
                    //do nothing
                  }else{
                    var current= value[0]['val'];
                    ticketOptions.forEach((element) {
                        if(element['id']==current){
                          element['selected']=true;
                          setState(() {
                                currentTicketTitle=element['title'];
                          });
                        }else{
                          element['selected']=false;
                        }
                    });
                    resetState();
                  }
                });
                },
                boxFitt: BoxFit.contain,
              ),
            );
          })
          ),
        ):Container()    
        ],
      )
    );
  }
}