
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
                 
                ],
              )
            ),
          );
        });
  }

}