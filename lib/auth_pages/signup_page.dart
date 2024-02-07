import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:abcbul/utils/Resusable_Signup_textfield.dart';
import 'package:abcbul/utils/show_terms_services_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../app_main_screen.dart';
import '../const.dart';
import '../services/sign_up_services/sign_up_api_call.dart';
import '../services/sign_up_services/sign_up_model.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameAndLastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool switchValue = false;

  String currentSelectedLocationValue = 'Şehiri Seç';

  bool termsAndConditionsResult = false;

  RoundedLoadingButtonController signUpButtonController =
      RoundedLoadingButtonController();
  @override
  void dispose() {
    userNameAndLastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(40.0),
      //   child: AppBar(
      //     elevation: 0,
      //     leading: Container(),
      //     actions: [],
      //     backgroundColor: Color(0xff1E293B),
      //   ),
      // ),
      backgroundColor: Color(0xff1E293B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.03,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: purpleColor,
                      ),
                      onPressed: () {
                        NavigationHelper.pushPage(context, AppMainScreen());
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return ConfirmationDialog(
                        //         onDeleteConfirmed: () {
                        //           Provider.of<TokenService>(context, listen: false)
                        //               .removeTokenFromPrefs()
                        //               .then((value) async {
                        //             SharedPreferences prefs =
                        //                 await SharedPreferences.getInstance();
                        //             print(prefs.getString('token'));
                        //             NavigationHelper.pushPage(context, SignInPage());
                        //           });
                        //         },
                        //         title: 'Çıkış Yapmak',
                        //         actionTextString:
                        //             'Çıkış yapmakt istediğinizden Emin misiniz?',
                        //         confirmButtonText: 'Çıkış',
                        //       );
                        //     });
                      },
                    ),
                  ),
                ),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),

                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // Check if the input contains only letters and spaces
                          if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                            return 'Invalid characters. Please enter only letters and spaces.';
                          }

                          // Additional checks or conditions can be added based on your requirements

                          return null; // Validation passed
                        },
                        prefixIcon: Icons.search,
                        label: 'Ad ve Soyad ....',
                        controller: userNameAndLastNameController,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }

                          final RegExp usernameRegExp = RegExp(
                              r'^[a-zA-Z0-9](?:[a-zA-Z0-9._]*[a-zA-Z0-9])?$');

                          if (!usernameRegExp.hasMatch(value)) {
                            return 'Invalid characters in the username';
                          }

                          if (value.length < 3 || value.length > 20) {
                            return 'Username must be between 3 and 20 characters';
                          }

                          return null; // Validation passed
                        },
                        prefixIcon: Icons.person,
                        label: 'Kullanıcı Adı ....',
                        controller: userNameController,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email address is required';
                          }

                          // Regular expression for a basic email validation
                          final RegExp emailRegExp = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );

                          if (!emailRegExp.hasMatch(value)) {
                            return 'Invalid email address';
                          }

                          return null; // Validation passed
                        },
                        prefixIcon: Icons.mail,
                        label: 'E-posta adresi ....',
                        controller: emailController,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }

                          // Regular expression for a Turkish phone number validation
                          final RegExp phoneRegExp = RegExp(
                            r'^0[0-9]{10}$',
                          );

                          if (!phoneRegExp.hasMatch(value)) {
                            return 'Invalid Turkish phone number';
                          }

                          return null; // Validation passed // Validation passed
                        },
                        prefixIcon: Icons.phone,
                        label: 'Telefon....0 ile başlasın',
                        controller: phoneController,
                      ),
                      CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }

                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }

                            return null; // Validation passed
                          },
                          obscureText: true,
                          prefixIcon: Icons.lock,
                          label: 'Şifre....',
                          controller: passwordController),
                      Container(
                        decoration: BoxDecoration(
                            // color: backgroundColor,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff10172A),
                            // label: Text(
                            //   label,
                            //   style: TextStyle(color: Colors.grey.shade200),
                            // ),
                            // prefixIcon: Icon(
                            //   prefixIcon,
                            //   size: 15,
                            //   color: Colors.white,
                            // ),
                            // hintText: 'Bul...',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),

                            errorStyle: const TextStyle(fontSize: 0.01),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                // width: LayoutConstants.dimen_1,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          validator: (value) {
                            print('the value is $value');
                            if (value == 'Şehir Seç') {
                              print('error ');
                              return 'Please select a location';
                            }
                            return null;
                          },
                          isExpanded: true,
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                          iconSize: 30,
                          // underline: SizedBox(), // Hide the default underline
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          dropdownColor: Color(0xff10172A),
                          value: currentSelectedLocationValue,

                          items: citiesList.map((String value) {
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
                              currentSelectedLocationValue = newValue!;
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
                                color: switchValue
                                    ? purpleColor
                                    : backgroundColor),
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
                                      onChanged: (value) {
                                        setState(() {
                                          switchValue = value;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          termsAndConditionsResult =
                              await showTermsAndServicesDialog(context);
                          setState(() {
                            termsAndConditionsResult;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: lightGreyColor,
                            border: Border.all(
                                color: termsAndConditionsResult
                                    ? purpleColor
                                    : backgroundColor),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      RoundedLoadingButton(
                        borderRadius: 10,
                        height: MediaQuery.of(context).size.height * 0.06,
                        color: dullPurpleColor,
                        controller: signUpButtonController,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserSignUp userSignUp = UserSignUp();
                            SignUpResult result = await userSignUp.signUpUser(
                              nameAndLastName:
                                  userNameAndLastNameController.text,
                              userName: userNameController.text,
                              role: switchValue ? 'Worker' : 'Client',
                              email: emailController.text,
                              phoneNumber: phoneController.text,
                              city: currentSelectedLocationValue,
                              password: passwordController.text,
                            );

                            if (result.success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 3,
                                  content: Text(
                                    'Başarıyla oluşturuldu',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.teal,
                                ),
                              );
                              print('successfully created');
                              signUpButtonController.success();
                              await Future.delayed(Duration(seconds: 1));
                              signUpButtonController.reset();

                              NavigationHelper.pushPage(context, SignInPage());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  closeIconColor: Colors.white,
                                  elevation: 3,
                                  content: Text(
                                    result.failureReason.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              print('an error occurred');
                              signUpButtonController.error();
                              await Future.delayed(Duration(seconds: 1));
                              signUpButtonController.reset();
                            }
                          } else {
                            signUpButtonController.error();
                            await Future.delayed(Duration(seconds: 1));
                            signUpButtonController.reset();
                          }
                        },
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
      ),
    );
  }
}

class LineFillProgressSnackBar extends StatelessWidget {
  final String message;

  LineFillProgressSnackBar({required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
          SizedBox(
              width:
                  16.0), // Add some spacing between the progress indicator and text
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
  }
}
