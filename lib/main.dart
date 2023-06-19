import 'package:flutter/material.dart';
import 'package:flutterapi/classes/bottombar/bottomnavigationexample.dart';
import 'package:flutterapi/classes/homescreen.dart';
import 'package:flutterapi/classes/splash.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('shopping_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BottomNavigationExample(),
    );
  }
}
