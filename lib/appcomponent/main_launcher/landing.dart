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
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: "Search for pie apps"),
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_voice),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Center(
                          child: Text("C"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Educational Clones",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                                color: Colors.lightBlue,
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 8,),
                                    Text(
                                      "himknk",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 8,),
                                    Text("4.9",style: TextStyle(color: Colors.grey),),
                                    Icon(Icons.star,size: 10,color: Colors.grey,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
