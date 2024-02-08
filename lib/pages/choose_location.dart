import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_class.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin')
  ];

  void goBackWithData(int index) async {
    await locations[index].getTime();
    if (!mounted) return;
    Navigator.pop(context, {
      'location': locations[index].location,
      'flag': locations[index].flag,
      'time': locations[index].time,
      'isDayTime': locations[index].isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                goBackWithData(index);
              },
              leading: CircleAvatar(
                  child: Image.asset('assets/${locations[index].flag}')),
              title: Text(locations[index].location),
            );
          },
        ));
  }
}
