import 'package:api_aproach/approach_two_with_mvvm_provider/view/homepage_provider_approach.dart';
import 'package:api_aproach/approach_two_with_mvvm_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'approach_one_with_getx/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => UserViewModel()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomepageProviderApproach(),
      ),
    );
  }
}
