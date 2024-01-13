import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../const.dart';
import '../provider_get_user_token.dart';
import 'login_model_class.dart';

import '../../const.dart';
import 'login_model_class.dart';

class SignInResult {
  final bool success;
  final ApiResponse? apiResponse; // ApiResponse is optional when not successful
  final String? failureReason; // Failure reason is optional when successful

  SignInResult({required this.success, this.apiResponse, this.failureReason});
}

class UserLogin {
  Future<SignInResult> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var request =
        await http.Request('POST', Uri.parse('$baseUrl/api/mobile/auth/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);

      Provider.of<TokenService>(context, listen: false)
          .saveTokenToPrefs(apiResponse.token);

      // tokenManagerProvider.setToken(token);

      // Return a success result with the ApiResponse
      return SignInResult(success: true, apiResponse: apiResponse);
    } else {
      // Return a failure result with the reason
      String failureReason = response.reasonPhrase ?? "Unknown reason";
      return SignInResult(success: false, failureReason: failureReason);
    }
  }
}
