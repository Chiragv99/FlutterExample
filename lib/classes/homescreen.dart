import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/classes/block/counterbloc.dart';
import 'package:flutterapi/classes/bottombar/bottomnavigationexample.dart';
import 'package:flutterapi/classes/detailpage.dart';
import 'package:flutterapi/classes/sequence/addsequence.dart';
import 'package:flutterapi/model/addCanvasModel.dart';
import 'package:flutterapi/model/invoice.dart';
import 'package:flutterapi/uttils/uttils.dart';
import '../common/coustom_bottom_nav_bar.dart';
import '../common/default_button.dart';
import '../database/dbManager.dart';
import '../enums.dart';
import '../model/addSettingData.dart';
import '../widget/country_selection_textfield_widget.dart' show CountrySelectionTextField;
import 'package:need_resume/need_resume.dart';

class HomeScreen extends StatelessWidget {

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


  TextEditingController areaController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController meterController = TextEditingController();
  TextEditingController frameController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController rateController = TextEditingController();


  final FocusNode _areaNode = FocusNode();
  final FocusNode _sizedNode = FocusNode();
  final FocusNode _meterNode = FocusNode();
  final FocusNode _framedNode = FocusNode();
  final FocusNode _workNode = FocusNode();
  final FocusNode _ratewordNode = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child:  Padding(padding:  const EdgeInsets.all(10),child: SizedBox(
          width: Uttils.getDeviceWidth(context),
          height: Uttils.getDeviceHeight(context),
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children:  <Widget> [
                const SizedBox(height: 30),
                const Padding(padding: EdgeInsets.all(20),child:  Text("Home",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
                Align(
                  alignment: Alignment.center,
                  child:    Column(
                    children:    <Widget> [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                                alignment: Alignment.topLeft,
                                child: Uttils.getHintFiledText("Meter")
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: meterController,
                                hintText: "Enter Meter Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                                alignment: Alignment.topLeft,
                                child: Uttils.getHintFiledText("Frame")
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: frameController,
                                hintText: "Enter Frame Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                                alignment: Alignment.topLeft,
                                child: Uttils.getHintFiledText("Work")
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: workController,
                                hintText: "Enter Work Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),

                            const SizedBox(
                              height: 12,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                                alignment: Alignment.topLeft,
                                child: Uttils.getHintFiledText("Rate")
                            ),),

                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: rateController,
                                hintText: "Enter Rate Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),

                            const SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                )

              ],
            )
            ,
          ),

        )),
      )
     ,
    );
  }

}