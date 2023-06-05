import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapi/classes/homescreen.dart';
import 'package:flutterapi/uttils/uttils.dart';

import '../database/dbManager.dart';


class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash>{
  final DbManager dbManager = DbManager();
  @override
  void initState() {
    super.initState();
    dbManager.openDb();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,   MaterialPageRoute(builder:
          (context) =>
          const HomeScreen()
      ));
    });
  }
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:
        Container(
          color: Colors.lightGreen,
          width: Uttils.getDeviceWidth(context),
          height:Uttils.getDeviceHeight(context),
          child:  const Center(
            child:  Text("Splash",style: TextStyle(fontSize: 25,color: Colors.black),) ,
          ),
        )
    );
  }

}