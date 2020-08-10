import 'package:flutter/material.dart';



import 'package:url_launcher/url_launcher.dart';


class Triptools extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stpage();
  }

}


class Stpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Stpagestate();
  }

}

class Stpagestate extends State<Stpage>{
  @override
  Widget build(BuildContext context) {

     final sizeW = MediaQuery.of(context).size.width;

   



    


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell( onTap: (){

    Navigator.pop(context,true);

        },child: PreferredSize( preferredSize: Size.fromHeight(500),child: Image.asset("images/leftarrow.png",width:4))),
        title: Center(child: Text("Trip tools", style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),),),
        actions: <Widget>[
          
        ],
     
      ),
      body: Container(

        height: double.infinity,
        color: Color.fromRGBO(123, 26, 17, 1),
        child:Container(
            height: double.infinity,
          width: sizeW,
            color: Color.fromRGBO(169, 26, 27, 1) ,

            child: Column(children: <Widget>[

              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0,bottom:5),
                      child: Container( alignment: Alignment.topLeft,child: Text("DEPARTURE INFORMATION", style: TextStyle(

                        color: Colors.white,
                        letterSpacing: 1
                      ),)),
                    ),

                    InkWell(
                onTap: (){

                
                },
                              child: InkWell(

                                onTap: (){
                                  print("open timetables");
                                  launch("https://nxbus.co.uk/west-midlands/plan-your-journey#");
                                },
                                                              child: Container(
                   width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/clock.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Timetables",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
                              ),
              )
                  ],
                ),
              ),
               InkWell(
                 onTap: (){
                   print("open service changes");
                 },
                                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left:25.0,bottom:5),
                        child: Container( alignment: Alignment.topLeft,child: Text("SERVICE CHANGES", style: TextStyle(

                          color: Colors.white,
                          letterSpacing: 1
                        ),)),
                      ),

                      InkWell(
                  onTap: (){

                    print("ooop");

                  
                  },
                                child: InkWell(
                                  onTap: (){
                                    print("hi");
                                    launch("https://nxbus.co.uk/west-midlands/information/service-changes");
                                  },
                                                                  child: Container(
                     width: 380,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(215, 216, 218, 1),
                              offset: new Offset(0, 3))
                        ]),
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "images/speaker.png",
                        width: 50,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Service changes",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      Image.asset("images/rightarrow.png", width: 35),
                      SizedBox(
                        width: 4,
                      )
                    ]),
                  ),
                                ),
              )
                    ],
                  ),
              ),
               )

            ],),
            
          )
          
      ) 
      
      );
    
  }

}