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
          primary: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      child: Text(str_header),
    );
  }

  static isEmailValid(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    print (emailValid);
    return emailValid;// true
  }

  static getHeader(String header, double height){
    return  Center(
      child: SizedBox(
          width: 200,
          height: height,
          child: Center(
            child: Text(header,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),) ,
          )
      ),
    );
  }

  static Widget getEditText(String text, String hint, TextEditingController emailController, FocusNode emailFocus){
    return   TextField(
      style:  const TextStyle(color: Colors.white),
      controller: emailController,
      focusNode: emailFocus,
      keyboardType: TextInputType.visiblePassword,
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
          labelStyle: const TextStyle(
              color: Colors.white
          ),
          hintText: hint),
    );
  }
}