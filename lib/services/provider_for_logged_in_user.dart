import 'package:abcbul/services/login_services/login_model_class.dart';
import 'package:flutter/material.dart';

class UserSessionProvider extends ChangeNotifier {
  LoginApiResponse? loginApiResponse;
  addLoginResponse(LoginApiResponse loginApiResponse) {
    print('in the provider and the name is ${loginApiResponse.user.name}');
    this.loginApiResponse = loginApiResponse;
    // print(loginApiResponse.user.name);
    notifyListeners();
  }
}
