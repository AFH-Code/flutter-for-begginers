import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Savedata'),),
        body: Savedata()
    );
  }
}

class Savedata extends StatefulWidget {
  @override
  _SavedataState createState() => _SavedataState();
}

class _SavedataState extends State<Savedata> {
  @override
  void initState() {
    super.initState();
    readAndWritePreference();
  }

  int? appCounter = 0;
  Future readAndWritePreference() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter');
    if (appCounter == null) {
      appCounter = 1;
    } else {
      appCounter = appCounter! + 1;
    }

    await prefs.setInt('appCounter', appCounter!);
    setState(() {
      appCounter = appCounter;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Text('You have opened the app ' + appCounter.toString() + ' times.'),
                ElevatedButton(
                  onPressed: () {
                  deletePreference();
                  },
                  child: Text('Reset counter'),
                ),
                ElevatedButton(
                  onPressed: () {  Navigator.of(context).pop(); },
                  child: Text('Go back'),
                )
            ],
        )
    );

  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

}