import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_data_controller.dart';

class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);



final postDataController = Get.put(PostDataController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Data with GetX"),
        centerTitle: true,
      ),
      body: GetX<PostDataController>(builder: (postController){
        return  Visibility(
          visible: postDataController.isLoaded.value,
         replacement: const Center(child: CircularProgressIndicator(),),

          child: ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(postController.postList[index].title.toString() + index.toString()),
                );
              }),

        );

      },
      ),




    );
  }
}
