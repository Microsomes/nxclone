import 'package:flutter/material.dart';
import 'package:nxclone/v2/main/bar.dart';


class LandingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LandingPageState();
  }

}

class LandingPageState extends State<LandingPage>{
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
          )


        ],
      )
    );
  }

}