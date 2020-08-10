import 'package:flutter/material.dart';


class TicketInfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(153, 11, 23, 0.7),
        title: Text(""),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.clear,size:25),
          onPressed: (){},)
        ],
        
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Container(
                    width:MediaQuery.of(context).size.width/2,
                    color: Colors.white,
                    child: Center(
                      child: Text("Ticket info", style: TextStyle(
                        fontSize: 17
                      ),),
                    ),
                  ),
                     Container(
                    width:MediaQuery.of(context).size.width/2,
                    color: Color.fromRGBO(111, 15, 16, 1),
                    child: Center(
                      child: Text("T&Cs", style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                      ),),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }

}