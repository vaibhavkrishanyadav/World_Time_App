import 'package:flutter/material.dart';
import 'package:worldtime/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York', url: 'America/New_York'),
    WorldTime(location: 'Singapore', url: 'Asia/Singapore'),
    WorldTime(location: 'Seoul', url: 'Asia/Seoul'),
    WorldTime(location: 'Tokyo', url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', url: 'Australia/Sydney'),
    WorldTime(location: 'Hong Kong', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Melbourne', url: 'Australia/Melbourne'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', url: 'America/Chicago'),
    WorldTime(location: 'Qatar', url: 'Asia/Qatar'),
    WorldTime(location: 'Riyadh', url: 'Asia/Riyadh'),
    WorldTime(location: 'Macau', url: 'Asia/Macau'),
    WorldTime(location: 'Kabul', url: 'Asia/Kabul'),
    WorldTime(location: 'Brisbane', url: 'Australia/Brisbane'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                    locations[index].location,
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
