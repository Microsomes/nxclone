import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class ChatGPT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat GPT Mobile"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: Center(
                child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      //CENTER THE TEXT
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),

                      hintStyle: TextStyle(),
                      hintText: 'Enter a query',
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.redAccent,
                    onPressed: () {
                      //SEND THE QUERY
                    },
                    icon: Icon(Icons.send)),
                    SizedBox(width: 20,)
              ],
            )),
          )
        ],
      ),
    );
  }
}
