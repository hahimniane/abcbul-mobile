import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/signup_page_screen/models/signup_page_model.dart';

/// A provider class for the SignupPageScreen.
///
/// This provider manages the state of the SignupPageScreen, including the
/// current signupPageModelObj
class SignupPageProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  SignupPageModel signupPageModelObj = SignupPageModel();

  bool isShowPassword = true;

  bool isSelectedSwitch = false;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in signupPageModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changeSwitchBox1(bool value) {
    isSelectedSwitch = value;
    notifyListeners();
  }
}
