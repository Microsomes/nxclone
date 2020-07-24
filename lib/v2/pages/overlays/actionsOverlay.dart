
import 'package:flutter/material.dart';

class ActionOverlay{


  void display(BuildContext context){
      showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
              )
            ),
            height: MediaQuery.of(context).size.height  * 0.37,
            
            child: Center(
              child:Column(
                children: <Widget>[

                  Expanded(
                    child: ListView(
                     children: <Widget>[
                       ListTile(
                        leading: Icon(Icons.launch),
                        title: Text("NX Rewards Cashback"),
                      ),
                      ListTile(
                        leading: Icon(Icons.restore),
                        title: Text("Purchase Again"),
                      ),
                      ListTile(
                        leading: Icon(Icons.send),
                        title: Text("Request ticket receipt"),
                      ),ListTile(
                        leading: Icon(Icons.close),
                        title: Text("Close"),
                      )
                     ]
                    )
                    
                  )
                 
                ],
              )
            ),
          );
        });
  }

}