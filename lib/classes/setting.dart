import 'package:flutter/material.dart';

import '../common/coustom_bottom_nav_bar.dart';
import '../database/dbManager.dart';
import '../enums.dart';
import '../model/addSettingData.dart';
import '../uttils/uttils.dart';
import '../widget/country_selection_textfield_widget.dart';


class Setting extends StatefulWidget {

  static String routeName = "/setting";

  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();

}

class _SettingScreen extends State<Setting>  with WidgetsBindingObserver{

  // Controller
  TextEditingController meterController = TextEditingController();
  TextEditingController frameController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController rateController = TextEditingController();


  final FocusNode _meterNode = FocusNode();
  final FocusNode _framedNode = FocusNode();
  final FocusNode _workNode = FocusNode();
  final FocusNode _ratewordNode = FocusNode();


  @override
  void initState() {
    super.initState();
    print("AppState- Init State");
    WidgetsBinding.instance?.addObserver(this);
    final DbManager dbManager = DbManager();
    dbManager.openDb().whenComplete(() async {
       getSettingData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.setting),
      body: Padding(padding:  const EdgeInsets.all(10),child: SizedBox(
        width: Uttils.getDeviceWidth(context),
        height: Uttils.getDeviceHeight(context),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            children:  <Widget> [
              const Padding(padding: EdgeInsets.all(20),child:  Text("Setting",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
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
                              myFocusNode: _meterNode,
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
                              myFocusNode: _framedNode,
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
                              myFocusNode: _workNode,
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
                              myFocusNode: _ratewordNode,
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
                    ElevatedButton.icon(
                      onPressed: () {
                        // Respond to button press
                        checkValidation();
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Submit"),
                    )
                  ],
                ),
              )

            ],
          )
         ,
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


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppState${state.name}");
    if (state == AppLifecycleState.resumed) {
      //do your stuff
    }
  }
}
