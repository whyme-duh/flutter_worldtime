
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;   //location name for the UI
  String flag;     // image flag for the country
  String url;
  String time;
  bool isDayTime = true;    // for the day and time 

  WorldTime({required this.location, required this.flag, required this.url,required this.time });

  Future<void> getTime() async{       // its is place holder value until the function is complete, its a promise

    try{
      String main_url = 'http://worldtimeapi.org/api/timezone/$url';
      Response res = await get(Uri.parse(main_url));
      Map time_Details = jsonDecode(res.body);

      //getting the properties from the JSON files
      String date_time = time_Details['datetime'];
      String off_set = time_Details['utc_offset'].substring(1,3);   //sustring removes the unwanted strings from the String

      //create a date time object
      DateTime now = DateTime.parse(date_time);
      print(date_time);
      print(now);
      now =now.add(Duration(hours: int.parse(off_set), minutes: 45 ));     // int parse wil convert the stirng into the interger
      print(now);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);    // it changese the time to somthing parsable
    }
    catch (e){
      print('caught error: $e');
      time = 'Could not get the data that you just inserted, try picking next location.';
    }

    

  }   
}
