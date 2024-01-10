import 'dart:math';

import 'package:abcbul/profile.dart';
import 'package:abcbul/proposals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const.dart';
import 'job.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         // handle button press
      //       },
      //       child: Container(
      //         padding: EdgeInsets.all(2),
      //         width: 35,
      //         height: 35,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey,
      //         ),
      //         child: Icon(
      //           Icons.logout,
      //           color: Colors.white70,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              child: Image(
                height: MediaQuery.of(context).size.height * 0.2,
                image: AssetImage('images/background.png'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              child: TabBar(
                padding: EdgeInsets.all(5),
                labelPadding: EdgeInsets.zero,
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5), // Adjust the border radius
                  ),
                  color: purpleColor, // Change the indicator color
                ),
                labelColor: Colors.white,
                controller: _tabController,
                tabs: [
                  Tab(text: 'Yeni Ihaleler'), // New Auctions
                  Tab(text: 'Eski Ihaleler'), // Old Auctions
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  YeniIhalelerScreen(), // New Auctions Screen
                  EskihalelerScreen(), // Old Auctions Screen
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YeniIhalelerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16.0, right: 10, left: 10, bottom: 20),
          child: Row(
            children: [
              CustomPaint(
                size: Size(100, 100),
                painter: PentagonPainter(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.lightbulb, size: 20, color: iconColor),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              CustomPaint(
                size: Size(100, 100),
                painter: PentagonPainter(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.fire_truck, size: 20, color: Colors.purple),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              CustomPaint(
                size: Size(100, 100),
                painter: PentagonPainter(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.photo_library_rounded,
                      size: 20, color: Colors.teal),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              CustomPaint(
                size: Size(100, 100),
                painter: PentagonPainter(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child:
                      Icon(Icons.account_balance, size: 20, color: iconColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.09,
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                label: Text(
                  'bul...',
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
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return JobCard(
                jobTitle:
                    'Title will come here and every thing else sdfdsf adfsf sdfdsf',
                jobSubtitle: 'it is a very pressing job. please get a teklif',
                jobLocation: 'Konya',
                numberOfProposals: 4,
                jobValidityTimeStamp: '20 gun 10 saat '
                    '20 dakika 12 saniye',
                numberOfJobsDoneBefore: 3,
              );
            },
          ),
        )
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final jobImageUrl;
  final String jobTitle;
  final String jobSubtitle;
  final String jobLocation;
  final int numberOfProposals;
  final String jobValidityTimeStamp;
  final int numberOfJobsDoneBefore;
  const JobCard({
    super.key,
    this.jobImageUrl,
    required this.jobTitle,
    required this.jobSubtitle,
    required this.jobLocation,
    required this.numberOfProposals,
    required this.jobValidityTimeStamp,
    required this.numberOfJobsDoneBefore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.purple,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            height: MediaQuery.of(context).size.height *
                0.1, // 40% of the Container's height
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: purpleColor, width: 0.6)), // Occupy entire width
            child: Image(
              width: MediaQuery.of(context).size.width * 0.2,
              fit: BoxFit.cover,
              image: AssetImage(
                  this.jobImageUrl ?? 'images/default_job_photo.webp'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: CustomIconWidget(
                        icon: Icons.done,
                        color: Colors.teal,
                        label: 'Başarılı'),
                  ),
                ),
                Expanded(
                  child: CustomIconWidget(
                      icon: FontAwesomeIcons.shieldCat,
                      color: orangeCustomColor,
                      label: 'Güvenilir'),
                ),
                Expanded(
                  child: CustomIconWidget(
                      icon: Icons.check_circle_outline_sharp,
                      color: purpleColor,
                      label: 'Premium'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0, right: 19),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                this.jobTitle,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 8, right: 19),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.jobSubtitle,
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, top: 0, right: 8),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'dfsfsdf  sadfsadf  asdf ',
          //       textAlign: TextAlign.left,
          //       style: GoogleFonts.montserrat(
          //           color: Colors.grey,
          //           fontWeight: FontWeight.w300,
          //           fontSize: 13),
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(bottom: 5, left: 10, top: 3),
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: CustomIconWidget(
                      icon: Icons.gps_fixed,
                      color: Colors.grey.shade300,
                      label: this.jobLocation),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                CustomIconWidget(
                    icon: Icons.back_hand_outlined,
                    color: Colors.grey.shade300,
                    label: '${this.numberOfProposals.toString()} teklif aldi'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CustomIconWidget(
                icon: Icons.timelapse,
                color: Colors.grey.shade300,
                label: this.jobValidityTimeStamp),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CustomIconWidget(
                icon: Icons.work,
                color: Colors.grey.shade300,
                label: 'daha once ${this.numberOfJobsDoneBefore} islem yapti'),
          ),
          GestureDetector(
            onTap: () async {
              FirebaseFirestore firestore = FirebaseFirestore.instance;
              dynamic data =
                  await firestore.collection('Users').doc('test').get();
              print(data);
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
                      'Teklif',
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
        ],
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  CustomIconWidget(
      {required this.icon, required this.color, required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: color,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        label,
        style: TextStyle(color: color),
      ),
    ]);
  }
}

class EskihalelerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Eski Ihaleler',
        style: TextStyle(color: Colors.blue),
      ), // Old Auctions Content
    );
  }
}

class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.fill;

    Path path = Path();
    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 5; i++) {
      double x = center.dx + radius * cos((i * 72 - 90) * pi / 180);
      double y = center.dy + radius * sin((i * 72 - 90) * pi / 180);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

double getPercentageOfScreen({
  required BuildContext context,
  required double percentage,
  required Measurement measurement,
}) {
  double screenSize;

  if (measurement == Measurement.height) {
    screenSize = MediaQuery.of(context).size.height;
  } else {
    screenSize = MediaQuery.of(context).size.width;
  }

  return (percentage / 100) * screenSize;
}

enum Measurement {
  height,
  width,
}
