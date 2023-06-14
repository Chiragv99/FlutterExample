import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapi/classes/login/login.dart';
import 'package:flutterapi/uttils/uttils.dart';
import '../common/size_config.dart';
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
      // Navigator.pushReplacement(context,   MaterialPageRoute(builder:
      //     (context) =>
      //     const HomeScreen()
      // ));
    });
  }
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(
        body:
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/images/clothes.jpg'),
                fit: BoxFit.cover
            )
          ),
          width: Uttils.getDeviceWidth(context),
          height:Uttils.getDeviceHeight(context),
          child: Container(
            decoration: BoxDecoration(
             gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
               Colors.black.withOpacity(.9),
               Colors.black.withOpacity(.4),
             ])
            ),
            child:  Padding(padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                    const Text(
                      "Brand New Perspective",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Let's start with our summer collection.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 200,
                ),
                InkWell(
                  child: getLoginButton(),
                  onTap: () {
                    print("Login"+"Login");
                    Navigator.pushReplacement(context,   MaterialPageRoute(builder:
                        (context) =>
                        const Login()
                    ));
                  },
                )
                ,
                const SizedBox(
                  height: 20,
                 ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
          ),
        )
    );
  }

   Widget getLoginButton(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)
      ),
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

   }
}