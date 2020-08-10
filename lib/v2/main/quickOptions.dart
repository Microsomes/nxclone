import 'package:flutter/material.dart';
import 'package:BlackPie/v2/pages/defaultTicket.dart';
import 'package:BlackPie/v2/pages/ejection.dart';
import 'package:BlackPie/v2/pages/landingPage.dart';

class QuickOptions extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuickOptionState();
  }
}

 class _QuickOptionState extends State<QuickOptions> {
   List quickOptions;
   @override
  void initState() {
    super.initState();
     quickOptions= new List();
    quickOptions.add({"title":"Landing Page","icon":Icons.settings,"asset":"images/landing1.png"});
    quickOptions.add({"title":"Default Ticket Page","icon":Icons.settings_applications,"asset":"images/ticket1.png"});
    quickOptions.add({"title":"Ejection Settings","icon":Icons.settings_bluetooth,"asset":"images/ejection1.png"});
    quickOptions.add({"title":"Knowledge Base","icon":Icons.settings_input_antenna,"asset":"images/knowledge1.png"});

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:GridView.count(crossAxisCount:2,
        children: 
          List.generate(quickOptions.length, (index)  {
            return InkWell(
              onTap: (){
                if(index==0){
                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                }else if(index==1){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DefaultTicket()),
                    );
                }else if(index==2){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ejection()),
                    );
                }
              },
                          child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width/3,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(189, 189, 189,1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                        new BoxShadow(
                        color: Colors.lightGreen,
                        offset: new Offset(2.0, 2.0),
                      )
                      ]
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height:110,
                    child: Center(child:Image.asset(quickOptions[index]['asset'],width: 90,),),
                    decoration: BoxDecoration(
                    ),
                  ),
                  Container(   
                    child: Text(quickOptions[index]['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),),
                  )
                ],
              ),
          ),
            );
          }) 
      )
    );
  }
  }