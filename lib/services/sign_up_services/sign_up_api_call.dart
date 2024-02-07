import 'package:abcbul/services/sign_up_services/sign_up_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import '../../const.dart';
import '../login_services/login_model_class.dart';
import '../provider_get_user_token.dart';

class UserSignUp {
  Future<SignUpResult> signUpUser({
    required String nameAndLastName,
    required String userName,
    required String role,
    required String email,
    required String phoneNumber,
    required String city,
    required String password,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://test.abcbul.com/api/mobile/auth/register'));
    request.body = json.encode({
      "name": nameAndLastName,
      "username": userName,
      "role": role,
      "email": email,
      "contact": phoneNumber,
      "city": city,
      "password": password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        // If registration is successful, parse the JSON response
        Map<String, dynamic> jsonResponse =
            json.decode(await response.stream.bytesToString());
        UserRegister user = UserRegister.fromJson(jsonResponse['register']);

        return SignUpResult(success: true, user: user);
      } else {
        // If registration is not successful, provide the failure reason
        return SignUpResult(
            success: false, failureReason: response.reasonPhrase);
      }
    } catch (e) {
      // Handle any exceptions that may occur during the registration process
      return SignUpResult(
          success: false,
          failureReason: 'An error occurred: ${response.statusCode}');
    }
  }
}

// class SignUpResult {
//   final bool success;
//   final UserRegister? user; // User details are optional when not successful
//   final String? failureReason; // Failure reason is optional when successful
//
//   SignUpResult({required this.success, this.user, this.failureReason});
// }
//
// class UserSignUp {
//   Future<SignUpResult> signUpUser({
//     required String nameAndLastName,
//     required String userName,
//     required String role,
//     required String email,
//     required String phoneNumber,
//     required String city,
//     required String password,
//   }) async {
//     var headers = {'Content-Type': 'application/json'};
//     var request =
//         http.Request('POST', Uri.parse('$baseUrl/api/mobile/auth/register'));
//     request.body = json.encode({
//       "name": nameAndLastName,
//       "username": userName,
//       "role": role,
//       "email": email,
//       "contact": phoneNumber,
//       "city": city,
//       "password": password
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       // If registration is successful, parse the JSON response
//       Map<String, dynamic> jsonResponse =
//           json.decode(await response.stream.bytesToString());
//       UserRegister user = UserRegister.fromJson(jsonResponse['register']);
//
//       return SignUpResult(success: true, user: user);
//     } else {
//       // If registration is not successful, provide the failure reason
//       return SignUpResult(success: false, failureReason: response.reasonPhrase);
//     }
//   }
// }
