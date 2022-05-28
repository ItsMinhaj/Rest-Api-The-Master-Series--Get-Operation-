import 'dart:convert';

import 'package:api_aproach/approach_two_with_mvvm_provider/model/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static List<UsersModel> user = [];
  static const String url = "https://jsonplaceholder.typicode.com/users";

  static fetchUser() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (Map i in data) {
          user.add(UsersModel.fromJson(i));
        }
        return user;
      } else {
        return debugPrint("Invalid Operation");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
