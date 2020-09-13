

import 'package:flutter/material.dart';


class ApplicationInfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell( onTap: (){

    Navigator.pop(context,true);

        },child: PreferredSize( preferredSize: Size.fromHeight(500),child: Image.asset("images/leftarrow.png",width:4))),
        title: Center(child: Text("Application info", style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),),),
      ),
      body: Center(
        child: Column(
           children: <Widget>[
             SizedBox(
               height: 50,
             ),
             Text("Application identifier", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("JDKRLGDNJJF", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),

            SizedBox(height: 25,),

           Text("Application version", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("4.24.6", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),

          SizedBox(height: 25,),


          
           Text("Platform name", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("Android 10", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),


          SizedBox(height: 25,),

          
           Text("Device model", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("OnePlus HD1903", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),


          SizedBox(height: 25,),

          
           Text("Build Number", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("45454824584", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),)






           ],
        ),
      )
    );
  }

}