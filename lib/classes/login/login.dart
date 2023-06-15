
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/classes/login/signup.dart';
import '../../common/default_button.dart';
import '../../uttils/uttils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login>{

  // Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();


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
      child: Container(
        width: Uttils.getDeviceWidth(context),
        height: Uttils.getDeviceHeight(context),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.10),
              Colors.black.withOpacity(.6),
            ])
        ),
        child:  Column(
          children:  [
            const Center(
              child: SizedBox(
                  width: 200,
                  height: 400,
                  child: Center(
                    child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),) ,
                  )
              ),
            ),
            Row(
              children: const [

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15), child: Uttils.getEditText('Email','Please Add Email!',emailController,_emailFocus),),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child:   Uttils.getEditText('Password','Please Add Password!',passwordController,_passwordFocus),),
            const SizedBox(height: 50,),
            const Padding(padding: EdgeInsets.all(10),child: Align(
              alignment: Alignment.topRight,
              child:  Text("Forgot Password?",style: TextStyle(color: Colors.red, fontSize: 16,fontWeight: FontWeight.bold),),
            ),),
            DefaultButton(text: "Login", press: () {
              checkValidation();
            }, width: 100, height: 45, textSize: 14,),
            const SizedBox(height: 20,),
            DefaultButton(text: "Sign Up", press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Signup(),
                ),
              );
            }, width: 100, height: 45, textSize: 14,)
          ],
        ),
      ),
    ),
 ),
    );

  }



  void checkValidation() {
    if(emailController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Email Address"));
    }
    else if(Uttils.isEmailValid(emailController.text.toString()) == false){
      Uttils.showSnakbar(context,const Text("Please Enter Valid Email Address"));
    }
    else if(passwordController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Password"));
    }
    else if(passwordController.text.toString().length < 4 ){
      Uttils.showSnakbar(context,const Text("Please Enter Password At Least 4 Character"));
    }
  }
}