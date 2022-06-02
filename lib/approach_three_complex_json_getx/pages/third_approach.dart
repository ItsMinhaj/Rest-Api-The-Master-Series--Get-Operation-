import 'package:api_aproach/approach_three_complex_json_getx/controller/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ThirdApproach extends StatelessWidget {
  const ThirdApproach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Approach - Complex Json "),
      ),
      body: GetX<ProductController>(builder: (controller) {
        return ListView.builder(
            itemCount: popularController.productModel!.products!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    controller.productModel!.products![index].name.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 10),
                  Text(controller.productModel!.products![index].description
                      .toString())
                ],
              );
            });
      }),
    );
  }
}
