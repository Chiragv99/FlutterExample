import 'package:flutter/material.dart';
import 'package:flutterapi/classes/login/login.dart';
import 'package:flutterapi/model/registerUser.dart';
import 'package:get/get.dart';

import '../../common/default_button.dart';
import '../../database/dbManager.dart';
import '../../uttils/uttils.dart';

class Signup  extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _Signup();
}
class _Signup extends State<Signup>{



  // Controller
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final FocusNode _firstnameFocus = FocusNode();
  final FocusNode _lastnameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _confirmFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    final DbManager dbManager = DbManager();
    dbManager.openDb().whenComplete(() async {

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
         child: SingleChildScrollView(
           child: Container(
             width: Uttils.getDeviceWidth(context),
             height: Uttils.getDeviceHeight(context),
             decoration: BoxDecoration(
                 gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                   Colors.black.withOpacity(.10),
                   Colors.black.withOpacity(.6),
                 ])
             ),
             child: Column(
               children:  [
                 Uttils.getHeader("SignUp",200),
                 Expanded(
                     child:
                SizedBox(
                  width: Uttils.getDeviceWidth(context),
                  height: Uttils.getDeviceHeight(context),
                  child: Center(
                    child:  Column(
                      children: [
                        Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 15), child:
                        Row(
                          children: [
                            Flexible(
                              child: Padding(padding: const EdgeInsets.all(10),child: SizedBox(
                                width: Uttils.getDeviceWidth(context) /2 ,
                                child: Uttils.getEditText("First Name", "First Name", firstnameController, _firstnameFocus),
                              ),) ,
                            ),
                            Flexible(
                                child:
                                Padding(padding: const EdgeInsets.all(10),child:
                                SizedBox(
                                  width: Uttils.getDeviceWidth(context) /2 ,
                                  child: Uttils.getEditText("Last Name", "Last Name", lastnameController, _lastnameFocus),
                                ),
                                ))
                          ],
                        ),),
                        Flexible(
                            child:
                            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),child:
                            SizedBox(
                              width: Uttils.getDeviceWidth(context)  ,
                              child: Uttils.getEditText("Email Address", "Email Address", emailController, _emailFocus),
                            ),
                            )),
                        Flexible(
                            child:
                            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),child:
                            SizedBox(
                              width: Uttils.getDeviceWidth(context)  ,
                              child: Uttils.getEditText("Password", "Password", passwordController, _passwordFocus),
                            ),
                            )),
                        Flexible(
                            child:
                            Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),child:
                            SizedBox(
                              width: Uttils.getDeviceWidth(context)  ,
                              child: Uttils.getEditText("Confirm Password", "Confirm Password", confirmController, _confirmFocus),
                            ),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        DefaultButton(text: "Sign Up", press: () {
                          checkvalidation();
                        }, width: 100, height: 45, textSize: 14,)
                      ],
                    ),
                  ),
                )
                )

               ],
             ),
           ),
         ),
       ),
     );
  }

  void checkvalidation() {
    if(firstnameController.text.toString() == ""){
      Uttils.showSnakbar(context, const Text("Please Enter Your First Name"));
    }
    else if(lastnameController.text.toString() == ""){
      Uttils.showSnakbar(context, const Text("Please Enter Your Last Name"));
    }
    else if(emailController.text.toString() == ""){
      Uttils.showSnakbar(context, const Text("Please Enter Your Email Address"));
    }
    else if(Uttils.isEmailValid(emailController.text.toString()) == false){
      Uttils.showSnakbar(context, const Text("Please Enter Your Valid Email Address"));
    }
    else if(passwordController.text.toString() == ""){
      Uttils.showSnakbar(context, const Text("Please Enter Your Password"));
    }
    else if(confirmController.text.toString() == ""){
      Uttils.showSnakbar(context, const Text("Please Confirm Your Password"));
    }
    else if(  passwordController.text.toString()  != confirmController.text.toString()){
      Uttils.showSnakbar(context, const Text("Your Password Doesn't Match!"));
    }
    else{
      var firstName = firstnameController.text.toString().trim();
      var lastName = lastnameController.text.toString().trim();
      var email  = emailController.text.toString().trim();
      var password = passwordController.text.toString().trim();
      checkUserisExist(firstName,lastName,email,password,context);
    }
  }

  void checkUserisExist(String firstName, String lastName, String email, String password, BuildContext context) async{
    final DbManager dbManager = DbManager();
    Future<bool> isExist = dbManager.checkUserIsExist(email);
    bool checkUser = await isExist;
    if(checkUser == true){
     // ignore: use_build_context_synchronously
     Uttils.showSnakbar(context, const Text("User Is Already Exist!"));
    }
    else{
      registerUser(firstName, lastName, email, password,context);
    }
  }

}

void registerUser(String firstName, String lastName, String email, String password, BuildContext context) {
  final DbManager dbManager = DbManager();
  var register = RegisterUser(firstname: firstName, lastname: lastName, email: email, password: password);
  dbManager.registerUser(register);
  Uttils.showSnakbar(context, const Text("You are Registered Successfully!"));
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Login(),
    ),
  );
}