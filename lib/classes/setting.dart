import 'package:flutter/material.dart';

import '../database/dbManager.dart';
import '../model/addSettingData.dart';
import '../uttils/uttils.dart';


class Setting extends StatefulWidget {

  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();

}

class _SettingScreen extends State<Setting>{

  // Controller
  TextEditingController meterController = TextEditingController();
  TextEditingController frameController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final DbManager dbManager = DbManager();
    dbManager.openDb().whenComplete(() async {
       getSettingData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding:  const EdgeInsets.all(10),child: SizedBox(
        width: Uttils.getDeviceWidth(context),
        height: Uttils.getDeviceHeight(context),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            children:   <Widget> [
              const Padding(padding: EdgeInsets.all(20),child:  Text("Setting",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
               TextField(
                keyboardType: TextInputType.number,
                controller: meterController,// change `text` every text input change
                decoration: const InputDecoration(labelText: 'Meter', border: OutlineInputBorder()),
              ),
               Padding(padding: const EdgeInsets.only(top: 20),child: TextField(
                controller: frameController,// change `text` every text input change
                decoration: const InputDecoration(labelText: 'Frame', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number
              ),
              ),
               Padding(padding: const EdgeInsets.only(top: 20),child: TextField(
                  controller: workController,// change `text` every text input change
                  decoration: const InputDecoration(labelText: 'Work', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number
              ),),
               Padding(padding: const EdgeInsets.only(top: 20),child: TextField(
                controller: rateController,// change `text` every text input change
                  decoration: const InputDecoration(labelText: 'Rate', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number
              ),),
              Padding(padding: const EdgeInsets.all(20),child:
              ElevatedButton(
                  onPressed: (){
                    checkValidation();
             //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddCanvas()));
              }, child: const Text("Submit")))
              // display your text
            ],
          ),
        ),

      )),
    );
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

  void checkValidation() {
    if(meterController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Meter Value"));
    }else if(frameController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Frame Value"));
    }else if(workController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Work Value"));
    }
    else if(rateController.text.toString() == ''){
      Uttils.showSnakbar(context,const Text("Please Enter Rate Value"));
    }
    else{
      var meter = meterController.text.toString();
      var frame = frameController.text.toString();
      var work = workController.text.toString();
      var rate = rateController.text.toString();

      var dbManager = DbManager();
      List<AddSettingData> setting = [];
      setting.add(AddSettingData(meter: meter, frame: frame, work:  work, rate:  rate, id: 0));
     var id =  dbManager.insertsettingdata(setting);
      Navigator.of(context).pop();
    }
  }

}
