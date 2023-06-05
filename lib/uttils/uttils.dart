import 'package:flutter/material.dart';

class Uttils  {

  static double getDeviceWidth(context){
    var intWidth = 0.0;
    intWidth =  MediaQuery.of(context).size.width;
    return intWidth;
  }
  static double getDeviceHeight(context){
    var intHeight = 0.0;
    intHeight =  MediaQuery.of(context).size.height;
    return intHeight;
  }
  static double Padding(context){
    var intHeight = 0.0;
    intHeight =  MediaQuery.of(context).size.height;
    return intHeight;
  }

  static showSnakbar(context, Text text){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
      content: text,
    ));
  }

}