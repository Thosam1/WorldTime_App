import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    //home: Home(),
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),   //context object = where they are, value is a function
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}
