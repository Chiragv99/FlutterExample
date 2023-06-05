import 'package:flutter/material.dart';
import 'package:flutterapi/classes/addcanvas.dart';
import 'package:flutterapi/classes/detailpage.dart';
import 'package:flutterapi/classes/setting.dart';
import 'package:flutterapi/model/addCanvasModel.dart';
import 'package:flutterapi/model/invoice.dart';
import 'package:flutterapi/uttils/constant.dart';
import 'package:flutterapi/uttils/uttils.dart';

import '../database/dbManager.dart';
import '../widget/edittext.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{

  final DbManager dbManager = DbManager();

  late TextEditingController _editingController;


  TextEditingController areaController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  String fullName = '';
  var lineItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController();

  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Padding(padding: const EdgeInsets.all(10),
         child:  SizedBox(
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
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Setting()));
                       },
                       child:   const ImageIcon(
                           AssetImage('assets/images/setting.png'), size: 50),),
                     ),
                   Padding(padding:  EdgeInsets.all(Constant.paddingMain),child:   _editTitleTextField('Area',areaController,TextInputType.number),),
                   Padding(padding:  EdgeInsets.all(Constant.paddingMain),child:   _editTitleTextField('Area',sizeController,TextInputType.number),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       ElevatedButton(onPressed: (){
                     //  showAddSequenceDialoug();
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddCanvas()));
                     }, child: const Text("Add Canvas"))],
                   ),
                   Padding(padding:  EdgeInsets.all(Constant.paddingMain),child:   _editTitleTextField('Area',sizeController,TextInputType.number),),
                   ElevatedButton(onPressed: (){
                    checkValidation();
                   }, child: const Text("Submit"))

                 ],
               ),
             )
         ),
       )
      ,
     );
  }

  Widget _editTitleTextField(String strLabel, TextEditingController areaController, TextInputType inputType) {
    return Center(
      child: TextFormField(
        keyboardType: inputType,
        controller: areaController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Area"),
        ),
        onChanged: (text) {
          setState(() {
            fullName = text;
          });
        },
      ),
    );;
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
}