import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class Services{
  static  String url = "https://jsonplaceholder.typicode.com/posts";

 static List<DataModel> dataModel = [];



  static fetchData() async{
    try
        {
          var response = await http.get(Uri.parse(url));

          if(response.statusCode == 200){
         var data =  json.decode(response.body);
        for(Map i in data){
          dataModel.add(DataModel.fromJson(i));
        }

        return dataModel;

          }else{
            return null;
          }

        }
        catch(e){
            debugPrint(e.toString());
          }

  }
}