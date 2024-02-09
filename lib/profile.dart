import 'package:abcbul/const.dart';
import 'package:abcbul/services/delete_Account/delete_account_api_call.dart';
import 'package:abcbul/services/login_services/login_model_class.dart';
import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/services/provider_for_logged_in_user.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_main_screen.dart';

class ProfilePage extends StatelessWidget {
  // Provider.of<UserSessionProvider>(context,listen:false);

  // LoginApiResponse response=LoginApiResponse()

  // Function to simulate account deletion
  void deleteAccount() {
    // Implement your account deletion logic here
    print('Account deleted');
  }

  // Function to simulate logout
  void logout() {
    // Implement your logout logic here
    print('User logged out');
  }

  @override
  Widget build(BuildContext context) {
    LoginApiResponse? userResponse =
        Provider.of<UserSessionProvider>(context, listen: false)
            .loginApiResponse;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                userResponse?.user == null ? Icons.logout : Icons.person,
                color: Colors.purple,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        onDeleteConfirmed: () {
                          Provider.of<TokenService>(context, listen: false)
                              .removeTokenFromPrefs()
                              .then((value) async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print(prefs.getString('token'));
                            NavigationHelper.pushPage(context, SignInPage());
                          });
                        },
                        title: 'Çıkış Yapmak',
                        actionTextString:
                            'Çıkış yapmakt istediğinizden Emin misiniz?',
                        confirmButtonText: 'Çıkış',
                      );
                    });
              },
            ),
          ),
          Visibility(
            visible: userResponse?.user == null ? false : true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.purple,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        onDeleteConfirmed: () {
                          String? token =
                              Provider.of<TokenService>(context, listen: false)
                                  .token;
                          DeleteAccountService deleteAccount =
                              DeleteAccountService();
                          // Handle account deletion logic here
                          deleteAccount.deleteAccount(token);
                          Provider.of<TokenService>(context, listen: false)
                              .removeTokenFromPrefs()
                              .then((value) async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print(prefs.getString('token'));
                            deleteAccount.deleteAccount(token);
                            NavigationHelper.pushPage(context, SignInPage());
                          });
                        },
                        title: 'Hesap Silme',
                        actionTextString:
                            'Hesabınızı silmek istediğinizden Emin misiniz? Bu işlemden geri adımı yok',
                        confirmButtonText: 'Sil',
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor, // Set background color to green
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/placeholder-search-5-dark.png'),
                ),
                // SvgPicture.asset(
                //   'images/placeholder_no_proposals_place_holder.svg',
                //   width: 100.0,
                //   height: 100.0,
                //   color: Colors.white, // Set the color of the SVG to white
                // ),
                SizedBox(height: 16.0),
                userResponse?.user != null
                    ? Column(
                        children: [
                          ListTile(
                            leading: Text(
                              'Kullanıcı Adı:',
                              style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              userResponse!.user.name,
                              style: TextStyle(
                                  color: purpleColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              'E-posta:',
                              style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              userResponse!.user.email,
                              style: TextStyle(
                                  color: purpleColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              'City:',
                              style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              userResponse!.user.city,
                              style: TextStyle(
                                  color: purpleColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: 16.0),
                          Text(
                            "Eşleşen sonuç yok",
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Bilgilerinizi görmek için,önce giriş yapmanız gerekmetedir!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                SizedBox(height: 8.0),

                //       Provider.of<TokenService>(context, listen: false)
                //           .removeTokenFromPrefs()
                //           .then((value) async {
                //         SharedPreferences prefs = await SharedPreferences.getInstance();
                //         print(prefs.getString('token'));
                //         NavigationHelper.pushPage(context, SignInPage());
                // Text(
                //   "Kımse senin işini yapmıyor.Gelen Teklifleri onayladıktan sonra tekrar gel!",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 16.0,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 16.0),

                // ElevatedButton(
                //   onPressed: () {
                //     NavigationHelper.pushPage(context, AppMainScreen());
                //   },
                //   child: Text('İşlere Teklif Ver'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
    //   Center(
    //   child: GestureDetector(
    //     onTap: () {
    //       Provider.of<TokenService>(context, listen: false)
    //           .removeTokenFromPrefs()
    //           .then((value) async {
    //         SharedPreferences prefs = await SharedPreferences.getInstance();
    //         print(prefs.getString('token'));
    //         NavigationHelper.pushPage(context, SignInPage());
    //       });
    //     },
    //     child: Text(
    //       'hi',
    //       style: TextStyle(color: Colors.blue),
    //     ),
    //   ),
    // );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String confirmButtonText;
  final String title;
  final String actionTextString;
  final VoidCallback onDeleteConfirmed;

  ConfirmationDialog(
      {required this.onDeleteConfirmed,
      required this.title,
      required this.actionTextString,
      required this.confirmButtonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Text(
        actionTextString,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("İptal"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: purpleColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            onDeleteConfirmed(); // Call the callback to delete the account
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            confirmButtonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

// To use the dialog, you can call it like this:
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return DeleteAccountConfirmationDialog(
//       onDeleteConfirmed: () {
//         // Handle account deletion logic here
//         print("Account deleted");
//       },
//     );
//   },
// );
