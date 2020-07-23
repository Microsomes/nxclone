import 'package:flutter/material.dart';

class PaymentConfirmed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: PreferredSize(
                preferredSize: Size.fromHeight(500),
                child: Image.asset("images/leftarrow.png", width: 4))),
        title: Center(
          child: Text(
            "Confirmation",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                Text("Transaction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
                ),
                SizedBox(height: 2,),
                Text("Successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
                ),
                SizedBox(height: 3,),
                Icon(Icons.check,size: 100,color: Color.fromRGBO(81, 164, 27, 1),),
                SizedBox(height: 20,),
                Text("Please activate your ticket just \nbefore boarding",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}