import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String url;
  bool isDayTime;

  WorldTime({ this.location, this.url });

  Future<void> getTime() async {

    try {
      //make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String offset1 = data['utc_offset'].substring(4,6);

      //create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offset1)));

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false ;

      time = DateFormat.jm().format(now);
    }

    catch (e) {
      print('Caught error  $e');
    }

  }

}

