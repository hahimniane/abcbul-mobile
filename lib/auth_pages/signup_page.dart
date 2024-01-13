import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:abcbul/utils/Resusable_Signup_textfield.dart';
import 'package:abcbul/utils/show_terms_services_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_main_screen.dart';
import '../const.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameAndLastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool switchValue = false;

  String? currentSelectedLocationValue = 'Location 1';

  bool result = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E293B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hesap Oluştur',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hesabını oluşturarak hizmete başlayalım',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    CustomTextField(
                      prefixIcon: Icons.search,
                      label: 'Ad ve Soyad ....',
                      controller: userNameAndLastNameController,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.person,
                      label: 'Kullanıcı Adı ....',
                      controller: userNameController,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.mail,
                      label: 'E-posta adresi ....',
                      controller: emailController,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.phone,
                      label: 'Telefon....',
                      controller: phoneController,
                    ),
                    CustomTextField(
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        label: 'Şifre....',
                        controller: passwordController),
                    Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        iconSize: 30,
                        underline: SizedBox(), // Hide the default underline
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        dropdownColor: Color(0xff10172A),
                        value: currentSelectedLocationValue,

                        items: <String>[
                          'Location 1',
                          'Location 2',
                          'Location 3',
                          // Add more locations as needed
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            currentSelectedLocationValue = newValue;
                          });
                        },
                      ),
                    ),

                    // RememberMeScreen(),
                    GestureDetector(
                      onTap: () {
                        // NavigationHelper.pushPage(context, AppMainScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  switchValue ? purpleColor : backgroundColor),
                          color: middleGreyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height * 0.09,
                        // width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.shield,
                              color: Colors.deepOrange,
                            ),
                            Text(
                              'Hizmet Verebilmek için aktif et!',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 20,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: CupertinoSwitch(
                                  activeColor: purpleColor,
                                  value: switchValue,
                                  onChanged: (value) =>
                                      setState(() => switchValue = value),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        result = await showTermsAndServicesDialog(context);
                        setState(() {
                          result;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          border: Border.all(
                              color: result ? purpleColor : backgroundColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        // width: MediaQuery.of(context).size.width * 0.85,
                        child: Center(
                          child: Text(
                            'Şartlar ve koşullar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    GestureDetector(
                      onTap: () {
                        // NavigationHelper.pushPage(context, AppMainScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          color: dullPurpleColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        // width: MediaQuery.of(context).size.width * 0.85,
                        child: Center(
                          child: Text(
                            'Hesap Oluştur',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
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
                          'Hesabınız var mi?',
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
                                NavigationHelper.pushPage(
                                    context, SignInPage());
                                // Implement your forgot password functionality here
                                // This can navigate to another screen or perform an action
                                // such as sending a reset password email.
                                print('Forgot password clicked');
                              },
                              child: Text(
                                'Buradan Giris Yapin',
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
        ),
      ),
    );
  }
}
