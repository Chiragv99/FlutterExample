import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/default_button.dart';
import '../../uttils/uttils.dart';
import '../../widget/country_selection_textfield_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login>{

  // Controller
  TextEditingController meterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Uttils.getDeviceWidth(context),
          height: Uttils.getDeviceHeight(context),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/clothes.jpg'),
                  fit: BoxFit.cover
              )
          ),
         child:  SingleChildScrollView(
      child: Column(
      children:  [
      const Center(
        child: SizedBox(
        width: 200,
        height: 300,
        child: Text("Login"),
      ),
    ),
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: getEditText('Email','Please Add Email!'),),
         Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          //padding: EdgeInsets.symmetric(horizontal: 15),
          child:   getEditText('Password','Please Add Password'),
        ),
        const SizedBox(
          height: 30,
        ),
        DefaultButton(
          text: "Submit",
          press: () {

          },
          width: 100,
          height: 45,
          textSize: 14,
        )
    ],
    ),
    ),
 ),
    );

  }

   Widget getEditText(String text, String hint){
    return   TextField(
      style:  const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          fillColor: const Color(0xFFF2F2F2),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            borderSide: BorderSide(width: 1,color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            borderSide: BorderSide(width: 1,color: Colors.grey),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)
          ),
          hintStyle:  const TextStyle(fontSize: 14,color: Colors.white),
          labelText: text,
          hintText: hint),
    );
   }
}