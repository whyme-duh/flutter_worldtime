import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

  

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String color = "red";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
        ),
        body:ElevatedButton(
          child: Icon(Icons.color_lens),
          onPressed: () {
            setState(() {
              color =" blue";
            });
          },
        ) ,
    );
      
  }
}

