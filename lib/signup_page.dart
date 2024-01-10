import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_main_screen.dart';
import 'const.dart';

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
                        NavigationHelper.pushPage(context, AppMainScreen());
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
                                  // overrides the default green color of the track
                                  activeColor: purpleColor,
                                  // color of the round icon, which moves from right to left
                                  // thumbColor: purpleColor,
                                  // when the switch is off
                                  // trackColor: Colors.black12,
                                  // boolean variable value
                                  value: switchValue,
                                  // changes the state of the switch
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
                        result = await _showTermsAndServicesDialog(context);
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
                        NavigationHelper.pushPage(context, AppMainScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          color: purpleColor,
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

Future<bool> _showTermsAndServicesDialog(BuildContext context) async {
  bool accepted = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: Text(
          'Şartlar ve Koşullar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Text(
            // Your terms and services text goes here
            termsAndConditionsString,
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context, false); // Return false when 'Geri' is tapped
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: lightGreyColor),
              child: Center(
                child: Text(
                  'Geri',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context, true); // Return true when 'Kabul Ediyorum' is tapped
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: purpleColor),
              child: Center(
                child: Text(
                  'Kabul Ediyorum',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );

  // Check the value returned from the dialog
  if (accepted) {
    // Do something if 'Kabul Ediyorum' was selected (true was returned)
    print('User accepted terms and conditions');
    return true;
    // Perform actions based on user acceptance
  } else {
    // Do something if 'Geri' was selected or the dialog was dismissed (false was returned)
    print('User did not accept terms and conditions');
    return false;
    // Perform actions based on user rejection or dismissal
  }
}

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String label;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.1,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff10172A),
            label: Text(
              label,
              style: TextStyle(color: Colors.grey.shade200),
            ),
            prefixIcon: Icon(
              prefixIcon,
              size: 15,
              color: Colors.white,
            ),
            // hintText: 'Bul...',
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
