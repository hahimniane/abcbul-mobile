import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/auth_pages/signin_page.dart';
import 'package:abcbul/auth_pages/signup_page.dart';
import 'package:abcbul/utils/Resusable_Signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_main_screen.dart';
import 'const.dart';
import 'home_page.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Set background color to green
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              Text(
                "Eşleşen sonuç yok",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "Kımse senin işini yapmıyor.Gelen Teklifleri onayladıktan sonra tekrar gel!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  NavigationHelper.pushPage(context, AppMainScreen());

                  // FirebaseFirestore firestore = FirebaseFirestore.instance;
                  // dynamic data =
                  //     await firestore.collection('Users').doc('test').get();
                  // print(data);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.front_hand_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'İşler gör',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
    );
  }
}
