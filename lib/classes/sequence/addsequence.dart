import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/getAlbumcontroller.dart';
import '../../uttils/uttils.dart';

class AddSequence extends StatefulWidget {
  const AddSequence({super.key});

  @override
  State<StatefulWidget> createState() => _AddSequence();
}

class _AddSequence extends State<AddSequence>{

  getAlbumController getAlbumListResponse = Get.put(getAlbumController());


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Padding(padding: const EdgeInsets.all(10),child:
        SizedBox(
          width: Uttils.getDeviceWidth(context),
          height: Uttils.getDeviceHeight(context),
          child:  DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children:  [
                const SizedBox(
                  height: 20,
                ),
                 const Padding(padding: EdgeInsets.all(20),child:  Text("Add Sequence",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
                 Obx(() => getAlbumListResponse.isLoading.value ? const Center(
                   child:  Center(
                     child: CircularProgressIndicator()  ,
                   ) ,
                 ) : Expanded(child:
                 ListView.builder(
                   itemCount: getAlbumListResponse.getAlbumListResponseData.length,
                   itemBuilder: (context, index) {
                     return Padding(padding: const EdgeInsets.all(10),child:
                       Card(
                       child:
                       ListTile(
                         title:
                             Column(
                               children: [
                                 Row(
                                   children: [
                                     Padding(padding: const EdgeInsets.all(10),child:  SizedBox(
                                       width: 50,
                                       height: 50,
                                       child:   FadeInImage.assetNetwork(
                                         placeholder: 'assets/images/placeholder.png',
                                         image: getAlbumListResponse.getAlbumListResponseData[index].url,
                                       ),),),
                                     Expanded(child: Text(getAlbumListResponse.getAlbumListResponseData[index].title,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                                     ),
                                   ],
                                 ),
                                  Padding(padding: const EdgeInsets.all(10),child:  Align(
                                    alignment: Alignment.topLeft,
                                    child:  Text(getAlbumListResponse.getAlbumListResponseData[index].title),
                                  ),)
                               ],
                             )
                       ),
                     ));
                   },
                 )))
              ],
            ),
          ),
        ),),
    );
  }
  }

