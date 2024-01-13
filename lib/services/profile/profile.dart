// import 'dart:convert';
//
// import 'package:http/http.dart' as http;

// class Profile {
//
//   // getUserProfile() async {
//   //   var headers = {
//   //     'Content-Type': 'application/json',
//   //     'Authorization':
//   //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozMTIsIm5hbWUiOiJIYXNzaW1pb3UgbmlhbmUiLCJ1c2VybmFtZSI6Ik5pYW5lIiwicm9sZSI6IldvcmtlciIsImVtYWlsIjoibmVuZW5hbmUyQGdtYWlsLmNvbSIsImNvbnRhY3QiOiI1NTQxNTI0NDAzIiwiY2l0eSI6IkHEn3LEsSIsInBhc3N3b3JkIjoiJDJiJDEwJHpTcHFwa1dWdDZxd0dFQUFYbHBMbHVxeU9nSDhxZlYxSzJNcmtJcnRHb215S3dTOGV1MGdLIiwicmVzZXRfdG9rZW4iOiIxMDAzMzcyMCIsImVtYWlsVmVyaWZpZWQiOm51bGwsInRva2VuIjoiOTkxMiIsImV4cGlyZXNfYXQiOiIxNzA0ODEzODAwNTcyIiwiaW1hZ2UiOiJodHRwczovL2FiY2J1bC5jb20vaW1nL2RlZmF1bHQud2VicCIsInNob3J0X2JpbyI6bnVsbCwiZmlyc3Rfam9iX2RhdGUiOm51bGwsInRyaWFsX2VuZF9kYXRlIjpudWxsLCJzdWJzY3JpcHRpb25fZGF0ZSI6bnVsbCwic3Vic2NyaXB0aW9uX2VuZF9kYXRlIjpudWxsLCJpZF9udW1iZXIiOiI5OTk4MDMyNjgwNCIsImxhc3RfbG9naW4iOm51bGwsImNhcmRfdG9rZW4iOm51bGwsInN0YXR1cyI6ZmFsc2UsInN0YXJzIjowLCJwcm9qZWN0X2NvbXBsZXRlZCI6MCwiY3JlYXRlZF9hdCI6IjIwMjMtMTItMTlUMTc6MjA6NTIuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIzLTEyLTE5VDE3OjIwOjUyLjAwMFoifSwiaWF0IjoxNzA1MDgyNTg5LCJleHAiOjE3MDUxNjg5ODl9.TESsz6J-fUbfYwe-zfXnTREC_Jkts8Z_NqQ0Fn26t5A'
//   //   };
//   //   var request = http.Request(
//   //       'GET', Uri.parse('http://www.abcbul.com/api/mobile/auth/me'));
//   //   request.body = json.encode({
//   //     "name": "hashim admin",
//   //     "username": "test3",
//   //     "role": "Worker",
//   //     "email": "test3@admin.com",
//   //     "contact": "8484894949",
//   //     "city": "dalaba",
//   //     "password": "11111111"
//   //   });
//   //   request.headers.addAll(headers);
//   //
//   //   http.StreamedResponse response = await request.send();
//   //
//   //   if (response.statusCode == 200) {
//   //     print(await response.stream.bytesToString());
//   //   } else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }
// }
import 'dart:convert';
import 'package:abcbul/const.dart';
import 'package:http/http.dart' as http;

class Profile {
  getUserProfile(String token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse('$baseUrl/api/mobile/auth/me'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };
    //
    // var uri = Uri.parse('http://www.abcbul.com/api/mobile/auth/me');
    // var response = await http.get(uri, headers: headers);
    //
    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   print(response.reasonPhrase);
    // }
  }
}
