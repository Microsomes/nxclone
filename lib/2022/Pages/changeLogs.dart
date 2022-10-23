import 'package:BubbleGum/2022/2022helper.dart';
import 'package:flutter/material.dart';


class ChangeLogs extends StatefulWidget {
  @override
  _ChangeLogsState createState() => _ChangeLogsState();
}

class _ChangeLogsState extends State<ChangeLogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Change Logs"),
      ),
      body: FutureBuilder(
        future: NXChangelogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView(
              children: [
                for(var i=0;i<snapshot.data.length;i++)
                ListTile(
                  title: Text(snapshot.data[i].toString())
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        
      )
    );
  }
}