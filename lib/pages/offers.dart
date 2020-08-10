import 'package:flutter/material.dart';





class Offers extends StatelessWidget{
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

    List<String> ticketTypes= [
      "West Midlands",
 

    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell( onTap: (){

    Navigator.pop(context,true);

        },child: PreferredSize( preferredSize: Size.fromHeight(500),child: Image.asset("images/leftarrow.png",width:4))),
        title: Center(child: Text("Select ticket type", style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),),),
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 3,),
        Container(
          height: 6,
          width: sizeW,
          color: Color.fromRGBO(166, 27, 27, 1),   
        ),
       Expanded(
         child:  ListView.builder(
          itemCount: ticketTypes.length,
          itemBuilder: (BuildContext ctxt, int index){
            return Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              height: 90,
               alignment: Alignment.center,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.end
                ,children: <Widget>[
                Row(
                
                children: <Widget>[
                  SizedBox(width: 19,),
                Container(
                  alignment: Alignment.center,
                   height: 88
                  ,child: Text(ticketTypes[index])),
                Expanded(child: Text(""),),
                Image.asset("images/rightred.png",width:25),
                SizedBox(width: 15,),
              ],),

              Container(height: 2,
              color: Color.fromRGBO(230, 230, 230, 1),)

              ],)
            );
          },

        ),
       )

      ],)
    );
  }

}