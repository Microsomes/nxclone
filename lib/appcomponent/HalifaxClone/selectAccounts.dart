import 'package:flutter/material.dart';

class SelectAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectAccountState();
  }
}

class SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
          color: Color.fromRGBO(1, 63, 185, 1),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Send money to",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black
        ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
