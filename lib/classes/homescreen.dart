import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/classes/addcanvas.dart';
import 'package:flutterapi/classes/detailpage.dart';
import 'package:flutterapi/classes/setting.dart';
import 'package:flutterapi/model/addCanvasModel.dart';
import 'package:flutterapi/model/invoice.dart';
import 'package:flutterapi/uttils/constant.dart';
import 'package:flutterapi/uttils/uttils.dart';

import '../common/my_colors.dart';
import '../database/dbManager.dart';
import '../model/addSettingData.dart';
import '../widget/country_selection_textfield_widget.dart' show CountrySelectionTextField;
import 'package:need_resume/need_resume.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends ResumableState<HomeScreen> {

  final DbManager dbManager = DbManager();


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


  String fullName = '';



  var assetsImage = const AssetImage('assets/images/setting.png'); //<- Creates an object that fetches an image.
  //<- Creates a widget that displays an image.


  String dropdownvalue = 'A';
  var items =  ['A','B','C','D'];

  @override
  void onReady() {
    // Implement your code inside here
    print('HomeScreen is ready!');
  }

  @override
  void onResume() {
    // Implement your code inside here
    dbManager.openDb().whenComplete(() async {
      getSettingData();
    });
  }

  @override
  void onPause() {
    // Implement your code inside here
    print('HomeScreen is paused!');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final DbManager dbManager = DbManager();
    dbManager.openDb().whenComplete(() async {
      getSettingData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var image = Image(image: assetsImage, fit: BoxFit.cover);
     return Scaffold(
       body: Padding(padding: const EdgeInsets.all(10),
         child:
         SizedBox(
             width: Uttils.getDeviceWidth(context),
             height: Uttils.getDeviceHeight(context),
             child:  DecoratedBox(
               decoration: const BoxDecoration(
                   color: Colors.white
               ),
               child:
               Column(
                 children:   <Widget> [
                   const Text("Calculation",style: TextStyle(fontSize: 12,color: Colors.black),),
                    Align(
                     alignment: Alignment.topRight,
                     child: InkWell(
                       onTap: (){
                         push(context, MaterialPageRoute(builder: (context) => Setting()));
                       //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Setting()));
                       },
                       child:
                       Padding(padding: const EdgeInsets.only(top: 10),child:
                       Align(
                         alignment: Alignment.topRight,
                         child: SizedBox(
                           width: 40,
                           height: 40,
                           child:   Card(
                             elevation: 10,
                             child: Container(
                                 child: image
                             ),
                           ),
                         ),
                       ),
                     ))),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                                alignment: Alignment.topLeft,
                                child: getHintText("Area")
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: areaController,
                                myFocusNode: _areaNode,
                                hintText: "Enter Area Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                              alignment: Alignment.topLeft,
                              child:   getHintText("Size"),
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: sizeController,
                                myFocusNode: _sizedNode,
                                hintText: "Enter size here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {

                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                              alignment: Alignment.topLeft,
                              child:   Uttils.getHintFiledText("Meter"),
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: meterController,
                                myFocusNode: _meterNode,
                                hintText: "Enter Meter here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                              alignment: Alignment.topLeft,
                              child:   Uttils.getHintFiledText("Frame"),
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: frameController,
                                myFocusNode: _framedNode,
                                hintText: "Enter Frame Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {

                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownButtonHideUnderline(child:  DropdownButton(
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                )),
                                ElevatedButton(onPressed: (){
                                   print("Dropdown"+dropdownvalue);
                                }, child: const Text("Add Sequence"))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                              alignment: Alignment.topLeft,
                              child:  Uttils.getHintFiledText("Work"),
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: workController,
                                myFocusNode: _workNode,
                                hintText: "Enter Work Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {
                                }, onChanged: (String ) {  },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),child:  Align(
                              alignment: Alignment.topLeft,
                              child:   Uttils.getHintFiledText("Rate"),
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 46, right: 46),
                              child: CountrySelectionTextField(
                                myController: rateController,
                                myFocusNode: _ratewordNode,
                                hintText: "Enter Rate Here",
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.number,
                                onSubmited: (str) {

                                }, onChanged: (String ) {  },
                              ),
                            ),
                          ],
                        ),
                      )
                     ,
                    const SizedBox(
                    height: 20,
                   ),
                  Uttils.getMainButton("Submit"),
                 ],
               ),
             )
         ),
       )
      ,
     );
  }

  void calculateArea() {
    double area = double.parse(areaController.text);
    double size = double.parse(sizeController.text);
    print("Log${area  * size}");
  }

  void checkValidation() {
    if(areaController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Area"));
    }else if(sizeController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Size"));
    }else{
      calculateArea();
      List<LineItem> lineItems = [];
      lineItems.add(LineItem("description", 22.00));
      lineItems.add(LineItem("description", 22.00));
      lineItems.add(LineItem("description", 22.00));

     var dbManager = DbManager();
      List<AddCanvasModel> planets = [];
      planets.add(AddCanvasModel(area: areaController.text.toString(),canvas: sizeController.text.toString()));
      dbManager.insertPlanets(planets);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailPage(invoice:  Invoice("Chirag", "Ahmedabad",lineItems)),
        ),
      );
    }
  }

  showAddSequenceDialoug(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void getSettingData() async{
    final DbManager dbManager = DbManager();

    Future<List<AddSettingData>> listsetting   = dbManager.getSettingData();
    List<AddSettingData> listsettings = await listsetting;

    if(listsettings.isNotEmpty){

      var meter = listsettings[0].meter.toString();
      var frame = listsettings[0].frame.toString();
      var work = listsettings[0].work.toString();
      var rate = listsettings[0].rate.toString();

      setState(() {
         meterController.text = meter;
         frameController.text = frame;
         workController.text = work;
         rateController.text = rate;
      });
    }

  }


  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

   getHintText(String hint){
    return  Text(hint,style: const TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold));
  }
}