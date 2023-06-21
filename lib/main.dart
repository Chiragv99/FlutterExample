import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapi/classes/blockexample.dart';
import 'package:hive_flutter/adapters.dart';

import 'classes/block/app_cubit.dart';

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
      home: BlocProvider(create: (context) => AppCubit(),
      child: BlockExample(),),
    );
  }
}
