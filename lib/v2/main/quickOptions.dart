import 'package:flutter/material.dart';

class QuickOptions extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuickOptionState();
  }
}

 class _QuickOptionState extends State<QuickOptions> {
   List quickOptions;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();

     quickOptions= new List();

    quickOptions.add({"title":"Landing Page"});
    quickOptions.add({"title":"Default Ticket Page"});
    quickOptions.add({"title":"Ejection Settings"});
    quickOptions.add({"title":"Knowledge Base"});

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:GridView.count(crossAxisCount:2,
        children: 
          List.generate(quickOptions.length, (index)  {
            return Container(
            height: 2,
            width: MediaQuery.of(context).size.width/3,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(189, 189, 189,1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                      new BoxShadow(
                      color: Colors.lightGreen,
                      offset: new Offset(2.0, 2.0),
                    )
                    ]
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height:100,
                  child: Center(child: Icon(Icons.settings,size: 40,color: Colors.black,),),
                  decoration: BoxDecoration(
                  ),
                ),
                Container(   
                  child: Text(quickOptions[index]['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
                )
              ],
            ),
          );
          }) 
      )
    );
  }
  }