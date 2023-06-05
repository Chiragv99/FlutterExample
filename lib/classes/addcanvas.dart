import 'package:flutter/material.dart';
import 'package:flutterapi/model/addCanvasRate.dart';

import '../database/dbManager.dart';
import '../uttils/uttils.dart';

class AddCanvas extends StatefulWidget {
  const AddCanvas({super.key});

  @override
  State<StatefulWidget> createState() => _AddCanvas();
}

class _AddCanvas extends State<AddCanvas>{
  late TextEditingController _editingController;
  TextEditingController addCanvasController = TextEditingController();

  // For Database manager
  final DbManager dbManager = DbManager();
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
    // TODO: implement build
    return Scaffold(
      body: Column(
        children:  [
          const Padding(padding: EdgeInsets.all(30),child:  Center(
            child: Text("Add Canvas",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
          ),),
          Padding(padding: const EdgeInsets.all(30),child: _editTitleTextField('Canvas Rate',addCanvasController,TextInputType.number)),
          Padding(padding:  const EdgeInsets.all(30),child:  ElevatedButton(onPressed: (){
             addCanvas();
             }, child: const Text("Add"))
            ,)
        ],
      ),
    );
  }
  Widget _editTitleTextField(String strLabel, TextEditingController areaController, TextInputType inputType) {
    return Center(
      child: TextFormField(
        keyboardType: inputType,
        controller: areaController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Canvas"),
        ),
        onChanged: (text) {
          setState(() {

          });
        },
      ),
    );;
  }
  addCanvas(){
    if(addCanvasController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Canvas Rate"));
    } else{
      AddCanvasRate addCanvasRate = AddCanvasRate(canvasrate: addCanvasController.text.toString(),id: 0);
    var intId =  dbManager.insertCanvasRate(addCanvasRate);
    print("InsertId$intId");
    }
  }


}