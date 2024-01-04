import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
