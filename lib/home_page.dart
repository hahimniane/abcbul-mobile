import 'package:flutter/material.dart';
import 'const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          InkWell(
            onTap: () {
              // handle button press
            },
            child: Container(
              padding: EdgeInsets.all(2),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Icon(
                Icons.logout,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage('images/background.png'),
          ),
          ,
        ],
      ),
    );
  }
}
