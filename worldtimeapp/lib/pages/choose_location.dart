import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/times.dart';

class Choose extends StatefulWidget {
  const Choose({ Key? key }) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {

  List<WorldTime> locations = [
    WorldTime(location: "Kolkata", flag: 'india.png', url: 'Asia/Kolkata', time: ''),
    WorldTime(location: "Karachi", flag: 'pakistn.jpg', url: 'Asia/Karachi', time: ''),
    WorldTime(location: "Colombo", flag: 'sri lanka.jpg', url: 'Asia/Colombo', time: ''),
    WorldTime(location: "Shanghai", flag: 'china.png', url: 'Asia/Shanghai', time: ''),
    WorldTime(location: "Tokyo", flag: 'japan.png', url: 'Asia/Tokyo', time: ''),
    
  ];

  void timeUpdate(index) async{
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();

    //navigating to the home screen
    Navigator.pop(context, {
      'location': timeInstance.location, 
      'time' : timeInstance.time,
      'flag' : timeInstance.flag,
      'isDayTime' : timeInstance.isDayTime
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 4),
            child: Card(
              child: ListTile(
              onTap: () {
                //print(locations[index].location);
                timeUpdate(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),
            )
            ),
          );
          
        },
      ),
      
    );
  }
}