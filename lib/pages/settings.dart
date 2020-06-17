import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {

  String defaultHomePage="";


  Future getDefaultPage() async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString("defaultPage");
  }

  
  Future setHomePage(String homePage) async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.setString("defaultPage",homePage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("Start Page. Choose which page to load by default"),
              SizedBox(height: 10,),
              FutureBuilder(
                future: getDefaultPage(),
                builder: (context,snapshot){

                  print(snapshot.connectionState);

                  if(snapshot.connectionState== ConnectionState.done){
                    print("done loading prefs");
                    print(snapshot.data);
                  }
                  return Text("Current "+ snapshot.data.toString());
                
                }
              ),
              SizedBox(height: 10,),
              DropdownButton(
                  items: <String>['precaution', 'home page','ticket page'].map((String value) {
                    return new DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (a) {
                    print(a);

                     setHomePage(a).then((onValue){

                     });

                    setState(() {
                      defaultHomePage=a;
                    });
                  })
            ],
          ),
        ));
  }
}
