
import 'package:get/get.dart';

import '../model/data_model.dart';
import '../service/services.dart';

class PostDataController extends GetxController{
  var postList = <DataModel>[].obs;
  var isLoaded = false.obs;

  getData()async{
    var postData = await Services.fetchData();



    if (postData != null) {

      postList.value = postData;
      isLoaded.value = true;

    } else {
      return null;
    }
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }



}