import 'dart:convert';

import 'package:abcbul/const.dart';
import 'package:http/http.dart' as http;

class DeleteAccountService {
  deleteAccount(token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Cookie':
          '__Host-next-auth.csrf-token=ca26b30e833200936fa33164b496c149c755b21ed80727d912bc76015c928a34%7Cdaffca5e1d22b434f68e1584838fe3f2ab8f1decd86246998b6182f08e776615; session=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY1YTU5YzBlNmFiMDE0NzQ0YThjODdiYiIsIm5hbWUiOiJkZW5lbWUiLCJjb250YWN0IjoiMDAwMDAwMDAwMDAiLCJpZF9udW1iZXIiOm51bGwsImVtYWlsIjoiZGVuZW1lMUBnbWFpbC5jb20iLCJjaXR5IjoixZ5laGlyaSBTZcOnIiwicGFzc3dvcmQiOiIkMmIkMTAkeXhhM3AxeGVLUEM2Z1VWcFBSZ3RiLnlPTURKMkU5NmZycGZPb1hHMkg2WGtRcGNRdXBGdEsiLCJyZXNldF90b2tlbiI6IjEwMDYwMDQ5IiwidG9rZW4iOiIzOTM1IiwiZXhwaXJlc19hdCI6IjIwMjQtMDEtMTVUMjE6NTY6NDYuMzI1WiIsImltYWdlIjoiaHR0cHM6Ly90ZXN0LmFiY2J1bC5jb20vaW1nL2RlZmF1bHQud2VicCIsInN0YXR1cyI6dHJ1ZSwicHJvamVjdF9jb21wbGV0ZWQiOjAsImNyZWF0ZWRBdCI6IjIwMjQtMDEtMTVUMjA6NTY6NDYuMzMxWiIsInVwZGF0ZWRBdCI6IjIwMjQtMDEtMTVUMjA6NTY6NDYuMzMxWiIsIl9fdiI6MCwiaWQiOiI2NWE1OWMwZTZhYjAxNDc0NGE4Yzg3YmIifSwiaWF0IjoxNzA1MzYxOTkxLCJleHAiOjE3MDU0NDgzOTF9.4uAqWnsLRYF3MB4QrjsiwS0ngxMoK-73Dzez8CodNsc'
    };
    var request =
        http.Request('DELETE', Uri.parse('$baseUrl/api/mobile/auth/delete'));
    request.body = json.encode({"expires_at": "168"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
