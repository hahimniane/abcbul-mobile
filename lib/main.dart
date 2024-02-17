// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'core/app_export.dart';
//
// var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Future.wait([
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]),
//     PrefUtils().init()
//   ]).then((value) {
//     runApp(MyApp());
//   });
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return ChangeNotifierProvider(
//           create: (context) => ThemeProvider(),
//           child: Consumer<ThemeProvider>(
//             builder: (context, provider, child) {
//               return MaterialApp(
//                 theme: theme,
//                 title: 'abcbul',
//                 navigatorKey: NavigatorService.navigatorKey,
//                 debugShowCheckedModeBanner: false,
//                 localizationsDelegates: [
//                   AppLocalizationDelegate(),
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate,
//                 ],
//                 supportedLocales: [
//                   // const Locale('en', 'US'),
//                   const Locale('tr', 'TR'),
//                 ],
//                 initialRoute: AppRoutes.initialRoute,
//                 routes: AppRoutes.routes,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: true),
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        //https://www.abcbul.com/
        Uri.parse('https:www.abcbul.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10172A),
      // appBar: AppBar(
      //   title: const Text('Flutter WebView'),
      // ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
