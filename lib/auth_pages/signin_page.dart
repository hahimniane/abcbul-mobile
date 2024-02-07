import 'package:abcbul/services/login_services/login_api_call.dart';
import 'package:abcbul/services/login_services/login_model_class.dart';
import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/services/profile/profile.dart';

import 'package:abcbul/auth_pages/signup_page.dart';
import 'package:abcbul/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../app_main_screen.dart';
import '../const.dart';
import '../job.dart';
import '../utils/Resusable_Signup_textfield.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  RoundedLoadingButtonController signInController =
      RoundedLoadingButtonController();

  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Padding(
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
        ],
        backgroundColor: Color(0xff1E293B),
      ),
      backgroundColor: Color(0xff1E293B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.25,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 16.0, bottom: 32),
                      //   child: InkWell(
                      //     // splashColor: Colors.orange,
                      //     onTap: () {
                      //       print('tapped');
                      //     },
                      //     child: Container(
                      //       margin: EdgeInsets.only(top: 5),
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey.shade700,
                      //         borderRadius: BorderRadius.circular(5),
                      //       ),
                      //       height: MediaQuery.of(context).size.height * 0.08,
                      //       // width: MediaQuery.of(context).size.width * 0.85,
                      //       child: Center(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               FontAwesomeIcons.google,
                      //               color: Colors.red,
                      //             ),
                      //             SizedBox(
                      //               width: 5,
                      //             ),
                      //             Text(
                      //               'Google ile giris yapin',
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w300,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       color: Colors.grey,
                      //       height: 1,
                      //       width: MediaQuery.of(context).size.width * 0.4,
                      //     ),
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.symmetric(horizontal: 3.0),
                      //       child: Text(
                      //         'Yada',
                      //         style: TextStyle(color: Colors.grey),
                      //       ),
                      //     ),
                      //     Container(
                      //       color: Colors.grey,
                      //       height: 1,
                      //       width: MediaQuery.of(context).size.width * 0.41,
                      //     ),
                      //     // Divider(
                      //     //   indent: 4,
                      //     //   endIndent: MediaQuery.of(context).size.width * 0,
                      //     //   // color: Colors.yellow,
                      //     // ),
                      //   ],
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        height: MediaQuery.of(context).size.height * 0.45,
                        color: Color(0xff1E293B),
                        child: Form(
                          key: _signInFormKey,
                          child: Column(
                            children: [
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
                                prefixIcon: Icons.email,
                                label: 'email',
                                controller: emailController,
                              ),
                              // CustomSignInTextField(emailController: emailController),

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
                                prefixIcon: Icons.password,
                                label: 'şifre',
                                controller: passwordController,
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(bottom: 2),
                              //   width: MediaQuery.of(context).size.width * 0.9,
                              //   height:
                              //       MediaQuery.of(context).size.width * 0.09,
                              //   child: TextField(
                              //     controller: passwordController,
                              //     style: TextStyle(color: Colors.white),
                              //     decoration: InputDecoration(
                              //         filled: true,
                              //         fillColor: Color(0xff10172A),
                              //         label: Text(
                              //           'Şifre',
                              //           style: TextStyle(
                              //               color: Colors.grey.shade200),
                              //         ),
                              //         prefixIcon: Icon(
                              //           Icons.search,
                              //           size: 15,
                              //           color: Colors.white,
                              //         ),
                              //         // hintText: 'Bul...',
                              //         contentPadding: EdgeInsets.zero,
                              //         hintStyle: TextStyle(color: Colors.grey),
                              //         border: OutlineInputBorder()),
                              //   ),
                              // ),
                              RememberMeScreen(),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RoundedLoadingButton(
                                    borderRadius: 5,
                                    color: purpleColor,
                                    controller: signInController,
                                    onPressed: () async {
                                      if (_signInFormKey.currentState!
                                          .validate()) {
                                        UserLogin userLogin = UserLogin();
                                        SignInResult userStatus =
                                            await userLogin.signIn(
                                          // email: 'deneme2@gmail.com',
                                          // password: '11111111',

                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context,
                                        );

                                        if (userStatus.success) {
                                          signInController.success();
                                          await Future.delayed(
                                              Duration(seconds: 1));
                                          print('Sign-in was successful');
                                          NavigationHelper.pushPage(
                                              context, AppMainScreen());
                                        } else {
                                          signInController.error();

                                          Fluttertoast.showToast(
                                            msg: userStatus.failureReason
                                                .toString(),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          await Future.delayed(
                                              Duration(seconds: 1));

                                          print(
                                              'There is an issue: ${userStatus.failureReason}');
                                        }
                                      } else {
                                        signInController.error();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                      }

                                      //
                                      signInController.reset();
                                    },
                                    child: Center(
                                      child: _isLoading
                                          ? CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : Text(
                                              'Oturum aç',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  )
                                  // GestureDetector(
                                  //   onTap: () async {
                                  //     // Show loading indicator
                                  //     showLoadingIndicator();
                                  //
                                  //     UserLogin userLogin = UserLogin();
                                  //     SignInResult userStatus =
                                  //         await userLogin.signIn(
                                  //       email: emailController.text,
                                  //       password: passwordController.text,
                                  //       context: context,
                                  //     );
                                  //
                                  //     // Hide loading indicator after the sign-in process is complete
                                  //     hideLoadingIndicator();
                                  //
                                  //     if (userStatus.success) {
                                  //       print('Sign-in was successful');
                                  //       NavigationHelper.pushPage(
                                  //           context, AppMainScreen());
                                  //     } else {
                                  //       Fluttertoast.showToast(
                                  //         msg: userStatus.failureReason.toString(),
                                  //         toastLength: Toast.LENGTH_SHORT,
                                  //         gravity: ToastGravity.TOP,
                                  //         timeInSecForIosWeb: 1,
                                  //         backgroundColor: Colors.red,
                                  //         textColor: Colors.white,
                                  //         fontSize: 16.0,
                                  //       );
                                  //       print(
                                  //           'There is an issue: ${userStatus.failureReason}');
                                  //     }
                                  //   },
                                  //   child: Container(
                                  //     margin: EdgeInsets.only(top: 30),
                                  //     decoration: BoxDecoration(
                                  //       color: purpleColor,
                                  //       borderRadius: BorderRadius.circular(5),
                                  //     ),
                                  //     height:
                                  //         MediaQuery.of(context).size.height * 0.05,
                                  //     child: Center(
                                  //       child: _isLoading
                                  //           ? CircularProgressIndicator(
                                  //               valueColor:
                                  //                   AlwaysStoppedAnimation<Color>(
                                  //                       Colors.white),
                                  //             )
                                  //           : Text(
                                  //               'Oturum aç',
                                  //               style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 fontWeight: FontWeight.bold,
                                  //                 color: Colors.white,
                                  //               ),
                                  //             ),
                                  //     ),
                                  //   ),
                                  // ),
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
                                          NavigationHelper.pushPage(
                                              context, SignUpPage());
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
                                            decoration:
                                                TextDecoration.underline,
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
                      ),
                    ],
                  ),
                  color: Color(0xff1E293B),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }
}

class CustomSignInTextField extends StatelessWidget {
  const CustomSignInTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.09,
      child: TextField(
        controller: emailController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff10172A),
            label: Text(
              'Kullanıcı adı, E-posta veya Telefon',
              style: TextStyle(color: Colors.grey.shade200),
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
    );
  }
}

class RememberMeScreen extends StatefulWidget {
  @override
  _RememberMeScreenState createState() => _RememberMeScreenState();
}

class _RememberMeScreenState extends State<RememberMeScreen> {
  bool rememberMe = false;

  bool _isLoading = false;

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
