import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map jsonData = jsonDecode(response.body);
      String utcTime = jsonData['utc_datetime'];
      String utcOffset = jsonData['utc_offset'];
      DateTime dt = DateTime.parse(utcTime);
      Duration dur = Duration(
          hours: int.parse(utcOffset.substring(1, 3)),
          minutes: int.parse(utcOffset.substring(4, 6)));
      dt = dt.add(dur);
      time = DateFormat('hh:mm a').format(dt);
      isDayTime = dt.hour > 6 && dt.hour < 20 ? true : false;
    } catch (e) {
      time = 'Could not get time';
      print(e);
    }
  }
}
