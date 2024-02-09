import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../provider_get_user_token.dart';

class PostJob {
  static postJob(
      {required String title,
      required String description,
      required String status,
      required String category,
      required String city,
      required String estimated_time,
      required BuildContext context,
      String? cover = ''}) async {
    String? token = context.read<TokenService>().token;
    var headers = {
      'Authorization': 'Bearer $token',
      // 'Cookie':
      //     'session=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo4OSwibmFtZSI6ImRlbmVtZTIiLCJlbWFpbCI6ImRlbmVtZTJAZ21haWxsLmNvbSIsImNvbnRhY3QiOm51bGwsImNpdHkiOiJLb255YSIsInBhc3N3b3JkIjoiJDJiJDEwJEtIZ0FHSUduZlpMTzZrYWI5WDJwTXVWRlBqQ0lnWlRZWi41VGxVbEYyYXVyRThPSWg5ajZTIiwicmVzZXRfdG9rZW4iOiIxMDAzMTM5OSIsImVtYWlsVmVyaWZpZWQiOm51bGwsInRva2VuIjoiOTc4NiIsImV4cGlyZXNfYXQiOiIxNzA1OTQyNTA5MjEwIiwiaW1hZ2UiOiJodHRwczovL3Rlc3QuYWJjYnVsLmNvbS9pbWcvZGVmYXVsdC53ZWJwIiwic2hvcnRfYmlvIjpudWxsLCJmaXJzdF9qb2JfZGF0ZSI6bnVsbCwidHJpYWxfZW5kX2RhdGUiOm51bGwsInN1YnNjcmlwdGlvbl9kYXRlIjpudWxsLCJzdWJzY3JpcHRpb25fZW5kX2RhdGUiOm51bGwsImlkX251bWJlciI6bnVsbCwic3RhdHVzIjpudWxsLCJzdGFycyI6bnVsbCwicHJvamVjdF9jb21wbGV0ZWQiOjAsImNyZWF0ZWRfYXQiOiIyMDI0LTAxLTIyVDE1OjU1OjA5LjI2N1oiLCJ1cGRhdGVkX2F0IjpudWxsfSwiaWF0IjoxNzA3NDE0Mzk3LCJleHAiOjE3MDc1MDA3OTd9.lyu6Kj1RCs_ot6bR2FamyRMaXYLVj12Z7rbhYVGq2Jc'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://test.abcbul.com/api/mobile/job'));
    request.fields.addAll({
      'title': title,
      'description': description,
      'status': status,
      'category': category,
      'city': city,
      'estimated_time': estimated_time
      // '168', 360,720
    });
    request.files.add(await http.MultipartFile.fromPath('cover', cover!));
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
