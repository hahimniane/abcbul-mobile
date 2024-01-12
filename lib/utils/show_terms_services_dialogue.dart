import 'package:flutter/material.dart';

import '../const.dart';

Future<bool> showTermsAndServicesDialog(BuildContext context) async {
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
