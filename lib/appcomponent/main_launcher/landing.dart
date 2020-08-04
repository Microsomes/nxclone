import 'package:flutter/material.dart';

class MainLauncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainLauncherState();
  }
}

class MainLauncherState extends State<MainLauncher> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                            offset: Offset(1, 1), // changes position of shadow
                        ),
                      ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10,),
                          IconButton(icon: Icon(Icons.menu),onPressed: (){},),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(hintText: "Search for pie apps"),
                              style: TextStyle(fontSize: 18,color: Colors.grey),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.keyboard_voice),onPressed: (){},),
                          CircleAvatar(
                            radius: 15,
                            child: Center(child: Text("T"),),
                          ),
                          SizedBox(width: 20,)

                        ],
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
