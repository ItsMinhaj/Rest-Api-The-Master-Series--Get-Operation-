import 'dart:convert';

import 'package:api_aproach/approach_three_complex_json_getx/model/popular_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  PopularProductModel? productModel;
  var isLoading = false.obs;

  getPopularData() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse("http://mvs.bslmeiyu.com/api/v1/products/popular"));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        productModel = PopularProductModel.fromJson(result);
        return productModel;
      }
    } catch (e) {
      debugPrint("Error is $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPopularData();
  }
}
