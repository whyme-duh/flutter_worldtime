import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/settings.dart';


void main() => runApp(worldtimeapp());

class worldtimeapp extends StatefulWidget{

  @override
  _worldtimeappState createState() => _worldtimeappState();
}

class _worldtimeappState extends State<worldtimeapp> {
  

  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/location' : (context) => Choose(),
        '/settings' :(context)=> Settings(),
      },
    );
  }
}