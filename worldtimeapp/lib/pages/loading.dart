import 'package:flutter/material.dart';
import 'times.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kathmandu',  flag: 'assets/nepal.png', url: 'Asia/Kathmandu', time:''); 
    await instance.getTime();
    setState(() {
      
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location, 
        'time' : instance.time,
        'flag' : instance.flag,
        'isDayTime' : instance.isDayTime,
      });    // arguments in these are the maps which will pass the data to the home page from the loading page
    });
    
  }
  @override
  void initState(){
      super.initState();
      setUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitPulse(
          color: Colors.black,
          size: 50.0,
        )
      )
    );
    
  }
}