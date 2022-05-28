import 'package:api_aproach/approach_two_with_mvvm_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageProviderApproach extends StatelessWidget {
  const HomepageProviderApproach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Approach With Provider Mvvm"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: userProvider.isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 400,
                color: Colors.green,
                child: ListView.builder(
                  itemCount: userProvider.userModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          userProvider.userModelList[index].name.toString()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          userProvider.getUser();
        },
        label: const Text("Get User"),
      ),
    );
  }
}
