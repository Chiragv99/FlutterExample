import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/getAlbumReponse.dart';
import 'package:http/http.dart' as http;

class getAlbumController extends GetxController {
  var isLoading = false.obs;
  var getAlbumListResponseData = <GetAlbumListResponse>[].obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchPhotos();
  }


   Future<List<GetAlbumListResponse>?> fetchPhotos() async{
    http.Response response  = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if(response.statusCode == 200){
      var json =  response.body;
      var castsResp = getAlbumListResponseFromJson(json);
      getAlbumListResponseData.assignAll(castsResp);
      return getAlbumListResponseData;
    }else{
      return null ;
    }
  }

}