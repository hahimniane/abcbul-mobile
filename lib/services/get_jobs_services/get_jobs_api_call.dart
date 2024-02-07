import 'dart:convert';

import 'package:abcbul/const.dart';
import 'package:abcbul/services/get_jobs_services/get_jobs_modal.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class JobsService {
  static Future<List?> getAllJobsService(
      String token, BuildContext context) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo4OSwibmFtZSI6ImRlbmVtZTIiLCJlbWFpbCI6ImRlbmVtZTJAZ21haWxsLmNvbSIsImNvbnRhY3QiOm51bGwsImNpdHkiOiJLb255YSIsInBhc3N3b3JkIjoiJDJiJDEwJEtIZ0FHSUduZlpMTzZrYWI5WDJwTXVWRlBqQ0lnWlRZWi41VGxVbEYyYXVyRThPSWg5ajZTIiwicmVzZXRfdG9rZW4iOiIxMDAzMTM5OSIsImVtYWlsVmVyaWZpZWQiOm51bGwsInRva2VuIjoiOTc4NiIsImV4cGlyZXNfYXQiOiIxNzA1OTQyNTA5MjEwIiwiaW1hZ2UiOiJodHRwczovL3Rlc3QuYWJjYnVsLmNvbS9pbWcvZGVmYXVsdC53ZWJwIiwic2hvcnRfYmlvIjpudWxsLCJmaXJzdF9qb2JfZGF0ZSI6bnVsbCwidHJpYWxfZW5kX2RhdGUiOm51bGwsInN1YnNjcmlwdGlvbl9kYXRlIjpudWxsLCJzdWJzY3JpcHRpb25fZW5kX2RhdGUiOm51bGwsImlkX251bWJlciI6bnVsbCwic3RhdHVzIjpudWxsLCJzdGFycyI6bnVsbCwicHJvamVjdF9jb21wbGV0ZWQiOjAsImNyZWF0ZWRfYXQiOiIyMDI0LTAxLTIyVDE1OjU1OjA5LjI2N1oiLCJ1cGRhdGVkX2F0IjpudWxsfSwiaWF0IjoxNzA2OTE2MzgwLCJleHAiOjE3MDcwMDI3ODB9.o5uqvp1_svSCcO4ngIhwxS-5HCQuOuBnH73qAW86ZwM'
    };
    var request = http.Request(
        'GET', Uri.parse('https://test.abcbul.com/api/mobile/job'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List list = [];
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);

      // print(jsonResponse.length);
      for (int i = 0; i < jsonResponse['data'].length; ++i) {
        // print(jsonResponse['data'][i]);
        list.add(jsonResponse['data'][i]);
      }

      return list;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
