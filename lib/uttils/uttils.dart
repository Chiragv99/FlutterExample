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


  static getHintText(String hint){
    return  Text(hint,style: const TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold));
  }
  static getHintFiledText(String hint){
    return  Text(hint,style: const TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold));
  }

  static Widget getMainButton(String str_header){
    return  ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      child: Text(str_header),
    );
  }
}