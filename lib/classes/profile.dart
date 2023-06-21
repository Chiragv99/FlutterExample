import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(ProfileScreen());

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Profile Detail"),
              actions: <Widget>[
                //action button
                IconButton(
                  icon: Icon(Icons.power_settings_new),
                  onPressed: () {

                  },
                )
              ],
            ),
            body: ProfileDemo()));
  }
}


//perform logout on click of action menu logout button
class ProfileDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<ProfileDemo> {
  String username = "";
  String password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:
      Center(
          child:
          Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Name :",
              ),
            ),
            Text(" " + username),
          ],
        ),
        Divider(height: 0.5, indent: 0.0, endIndent: 0.0, color: Colors.pink),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Password :",
              ),
            ),
            Text(" " + password)
          ],
        ),
      ])),
    );
  }

}
