import 'package:abcbul/const.dart';
import 'package:abcbul/home_page.dart';
import 'package:abcbul/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_main_screen.dart';

class ProposalPage extends StatefulWidget {
  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  @override
  Widget build(BuildContext context) {
    bool a = false;
    bool isYeniHaleActive = true;
    bool isEskiIhaleActive = false;
    var inactiveButtonColor = Colors.grey.shade800;
    var inactiveTextColor = Colors.white54;
    var activeButtonColor = purpleColor;
    var activeTextColor = Colors.white;
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
