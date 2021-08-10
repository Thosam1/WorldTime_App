import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');  //-> get it in json file
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //int weeknumber = data['week_number'];


      print('datetime : $datetime');
      //print('offset : $offset');
      //print('week_number : $weeknumber');

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print('now : $now');

      //set the time property
      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      //print(isDayTime);
      time = DateFormat.jm().format(now); //package iuntl to make it more readable
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

}

/*  an example
WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
instance.getTime();
 */