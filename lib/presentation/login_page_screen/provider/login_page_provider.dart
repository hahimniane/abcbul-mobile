import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/login_page_screen/models/login_page_model.dart';

/// A provider class for the LoginPageScreen.
///
/// This provider manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginPageModel loginPageModelObj = LoginPageModel();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
