import 'package:api_aproach/approach_two_with_mvvm_provider/repository/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:api_aproach/approach_two_with_mvvm_provider/model/users_model.dart';

class UserViewModel with ChangeNotifier {
  List<UsersModel> _userModelList = [];
  bool _isLoading = false;

  List<UsersModel> get userModelList => _userModelList;
  bool get isLoading => _isLoading;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setUserModelList(List<UsersModel> userModelList) {
    _userModelList = userModelList;
    notifyListeners();
  }

  getUser() async {
    var userList = await RemoteServices.fetchUser();
    if (userList != null) {
      setUserModelList(userList);
      setLoading(true);
    } else {
      debugPrint("Operation Failed");
    }
  }
}
