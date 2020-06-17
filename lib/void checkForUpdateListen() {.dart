 void checkForUpdateListen() {
    print("check for updates");
    PackageInfo.fromPlatform().then((packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      Firestore.instance.collection("updates").document("current").snapshots().listen((onValue){
         var data = onValue.data;
        var serverVersion = data['version'];
        downloadUpdateLink= data['downloadPage'];

        if (serverVersion == version) {
          //up to date
          print("up to date");

          Fluttertoast.showToast(
              msg: "Currently up to date",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);
              isUpdateNeeded=false;
              setState(() {
                isUpdateNeeded=false;
              });
        } else {
          //if its not up to date
          //we will redirect to download apk
          isUpdateNeeded=true;
          setState(() {
            isUpdateNeeded=true;
          });
           Fluttertoast.showToast(
              msg: "Danger. Outdated. Please click download update NOW to download the latest apk",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);

        }
      });

     
    });
  }