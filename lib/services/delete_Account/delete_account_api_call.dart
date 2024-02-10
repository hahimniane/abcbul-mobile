import 'dart:convert';

import 'package:abcbul/const.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DeleteAccountService {
  static deleteAccount({required BuildContext context}) async {
    String? token = context.read<TokenService>().token;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('DELETE', Uri.parse('$baseUrl/api/mobile/auth/delete'));
    request.body = json.encode({"expires_at": "168"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
