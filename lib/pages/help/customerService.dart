

import 'package:flutter/material.dart';


class CustomerServicePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell( onTap: (){

    Navigator.pop(context,true);

        },child: PreferredSize( preferredSize: Size.fromHeight(500),child: Image.asset("images/leftarrow.png",width:4))),
        title: Center(child: Text("Customer service", style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),),),
      ),
      body: Center(
        child: Column(
           children: <Widget>[
             SizedBox(
               height: 50,
             ),
             Text("Phone: 0121 254 7272", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          
            SizedBox(height: 25,),

           Text("Website", style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20
             ),),
             SizedBox(height: 5,),
          Text("www.nxbus.co.uk/", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),

          SizedBox(height: 15,),


          
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Center(
               child: Text("Contact us if any issues arise. Please include your application ID in all requests. This information can be found within the application under Help > App Info.", style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 16
                 ),),
             ),
           ),
             SizedBox(height: 5,),
         

          
         
    





           ],
        ),
      )
    );
  }

}