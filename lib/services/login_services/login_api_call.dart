import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../const.dart';
import '../get_jobs_services/get_jobs_api_call.dart';
import '../provider_for_logged_in_user.dart';
import '../provider_get_user_token.dart';
import 'login_model_class.dart';

import '../../const.dart';
import 'login_model_class.dart';

class SignInResult {
  final bool success;
  final LoginApiResponse?
      apiResponse; // ApiResponse is optional when not successful
  final String? failureReason; // Failure reason is optional when successful

  SignInResult({required this.success, this.apiResponse, this.failureReason});
}

class UserLogin {
  Future<SignInResult> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var request = await http.Request(
        'POST', Uri.parse('https://test.abcbul.com/api/mobile/auth/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);

      LoginApiResponse apiResponse = LoginApiResponse.fromJson(jsonResponse);

      print(
          '//////////////////////////////////////////////////////////////////////');

      Provider.of<TokenService>(context, listen: false)
          .saveTokenToPrefs(apiResponse.token);

      Provider.of<UserSessionProvider>(context, listen: false)
          .addLoginResponse(apiResponse);

      print('the response was ok and the code is ${response.statusCode}');
      print(jsonResponse);
      // Return a success result with the ApiResponse
      return SignInResult(success: true, apiResponse: apiResponse);
    } else {
      // Return a failure result with the reason
      String failureReason = response.reasonPhrase ?? "Unknown reason";
      return SignInResult(success: false, failureReason: failureReason);
    }
  }
}
