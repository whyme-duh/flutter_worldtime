import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  Map allData = {};


  @override
  Widget build(BuildContext context){
    

    allData = allData.isNotEmpty ? allData : ModalRoute.of(context)!.settings.arguments as Map;  
    String bgImage = allData['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = allData['isDayTime'] ? Colors.blue : Colors.indigo;
    

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text("World Time"),
      centerTitle: true,),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                  RichText(
                    text:TextSpan(
                      text: "Menu",
                      style:TextStyle(fontSize: 50,
                      )
                    )
                    ),
                  ]
                ),
              )
              
              
            ),
            Card(
              child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.lock_clock),
                  title: Text("World Time App"),
                  onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.edit_location),
                    title: Text("Choose Location"),
                    onTap: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');   // pushes another screen on top on ongoing screen
                      setState(() {
                        allData = {
                          'time' : result['time'],
                          'location':result['location'],
                          'flag' : result['flag'],
                          'isDayTime' : result['isDayTime']
                        };
                      });
                    },
                  ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },

                )
                ],
              ),
            
            )
          ],
        )
      ),
      
      
      body: BodyTime(bgImage: bgImage, allData: allData)
    );
  }
}

class BodyTime extends StatelessWidget {
  const BodyTime({
    Key? key,
    required this.bgImage,
    required this.allData,
  }) : super(key: key);

  final String bgImage;
  final Map allData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
          child: Column(
          children : <Widget>[
              Image(image:AssetImage('${allData['flag']}') , 
                          width: 50, 
                          height: 100,
                          ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Text(
                    allData['location']
                    ,style: TextStyle(letterSpacing: 2, 
                    fontSize: 30,
                    color: allData['isDayTime'] ? Colors.black : Colors.white,
                    ),
                    ),
                  SizedBox(width: 30,),
                  Text(allData['time'],
                    style: TextStyle(
                    letterSpacing: 5,
                    color: allData['isDayTime'] ? Colors.black : Colors.white,

                    ),)
                ],
              )
          ]
        )
        ),
      )
    );
  }
}