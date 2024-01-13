import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Provider.of<TokenService>(context, listen: false)
              .removeTokenFromPrefs()
              .then((value) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            print(prefs.getString('token'));
            NavigationHelper.pushPage(context, SignInPage());
          });
        },
        child: Text(
          'hi',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
