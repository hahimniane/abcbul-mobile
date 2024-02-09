import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider_get_user_token.dart';

class JobBid {
  static bidForAJob(jobId, String description, String estimatedTime, amount,
      BuildContext context) async {
    String? token = context.read<TokenService>().token;

    var newHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request(
        'POST', Uri.parse('https://test.abcbul.com/api/mobile/proposal'));

    request.body = json.encode({
      "job_id": jobId,
      "description": description,
      // here we are sending number of days for estimated time. only days are accepted no hour jobs
      "estimated_time": estimatedTime,
      // the amount should be also be
      "amount": amount
    });

    request.headers.addAll(newHeaders);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
