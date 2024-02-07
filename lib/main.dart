import 'package:abcbul/services/provider_for_logged_in_user.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_main_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TokenService(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserSessionProvider(),
        ),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> tokenFuture;

  @override
  void initState() {
    Provider.of<TokenService>(context, listen: false).removeTokenFromPrefs();
    print('the token has been cleared');
    print(Provider.of<TokenService>(context, listen: false).token);
    ;
    super.initState();

    // Initialize the tokenFuture in the initState
    tokenFuture = getToken();
    print(' token after having clerared it $tokenFuture');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        home: AppMainScreen()
        // FutureBuilder<String?>(
        //   future: tokenFuture,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       final String? token = snapshot.data;
        //
        //       print('the token is-- $token');
        //
        //       return token != null ? AppMainScreen() : SignInPage();
        //     } else {
        //       return CircularProgressIndicator();
        //     }
        //   },
        // ),
        );
  }

  Future<String?> getToken() async {
    print(
        'the toke from getToken Method ${Provider.of<TokenService>(context, listen: false).loadTokenFromPrefs()}');
    return await Provider.of<TokenService>(context, listen: false)
        .loadTokenFromPrefs();
  }
}
