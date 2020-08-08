import 'package:flutter/material.dart';

//will show some details

class AccountDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AccountDetailsState();
  }

}

class AccountDetailsState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 231, 234, 1),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left,size: 40,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(
          "T.javed- 2367",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(1, 63, 185, 1),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.more_vert),onPressed: (){},)
        ],
        
      ),

      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top:10),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text("£0.62",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(height: 10,),
                          Text("Balance after pending",
                          style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:10),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text("£0.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(height: 10,),
                          Text("Overdraft limit",
                          style: TextStyle(fontSize: 10),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    
  }

}