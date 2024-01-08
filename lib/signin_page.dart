import 'package:abcbul/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_main_screen.dart';
import 'const.dart';
import 'job.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E293B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.15,
          ),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hos Geldin !',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sosyal medya veya kimlik bilgilerinle giris yapabilirsin',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 32),
                      child: InkWell(
                        // splashColor: Colors.orange,
                        onTap: () {
                          print('tapped');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                          // width: MediaQuery.of(context).size.width * 0.85,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Google ile giris yapin',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Text(
                            'Yada',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.41,
                        ),
                        // Divider(
                        //   indent: 4,
                        //   endIndent: MediaQuery.of(context).size.width * 0,
                        //   // color: Colors.yellow,
                        // ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      height: MediaQuery.of(context).size.height * 0.45,
                      color: Color(0xff1E293B),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.09,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff10172A),
                                  label: Text(
                                    'Kullanıcı adı, E-posta veya Telefon',
                                    style:
                                        TextStyle(color: Colors.grey.shade200),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  // hintText: 'Bul...',
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.09,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff10172A),
                                  label: Text(
                                    'Şifre',
                                    style:
                                        TextStyle(color: Colors.grey.shade200),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  // hintText: 'Bul...',
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Expanded(child: RememberMeScreen()),
                          GestureDetector(
                            onTap: () {
                              NavigationHelper.pushPage(
                                  context, AppMainScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height * 0.05,
                              // width: MediaQuery.of(context).size.width * 0.85,
                              child: Center(
                                child: Text(
                                  'Oturum aç',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hesabınız yok mu?',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w400),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Implement your forgot password functionality here
                                      // This can navigate to another screen or perform an action
                                      // such as sending a reset password email.
                                      print('Forgot password clicked');
                                    },
                                    child: Text(
                                      'Hesap Olustur',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: purpleColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: purpleColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                color: Color(0xff1E293B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RememberMeScreen extends StatefulWidget {
  @override
  _RememberMeScreenState createState() => _RememberMeScreenState();
}

class _RememberMeScreenState extends State<RememberMeScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (newValue) {
                setState(() {
                  rememberMe = newValue!;
                });
              },
            ),
            Text(
              'Beni Hatırla',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Implement your forgot password functionality here
                // This can navigate to another screen or perform an action
                // such as sending a reset password email.
                print('Forgot password clicked');
              },
              child: Text(
                'Şifreni mi unuttun?',
                style: TextStyle(
                  fontSize: 16.0,
                  color: purpleColor,
                  decoration: TextDecoration.underline,
                  decorationColor: purpleColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
