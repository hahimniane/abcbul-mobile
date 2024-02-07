import 'dart:math';

import 'package:abcbul/profile.dart';
import 'package:abcbul/proposals.dart';
import 'package:abcbul/services/get_jobs_services/get_jobs_api_call.dart';
import 'package:abcbul/services/navigation.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:abcbul/utils/show_terms_services_dialogue.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_main_screen.dart';
import 'auth_pages/signin_page.dart';
import 'const.dart';
import 'create_job_page.dart';
import 'create_proposal_page.dart';
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
                // indicatorColor: Colors.green,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.white,
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

Future<String?> getToken(context) async {
  return await Provider.of<TokenService>(context, listen: false)
      .loadTokenFromPrefs();
}

class YeniIhalelerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var jobs = JobsService.getAllJobsService(token, context);
    // print(jobs.runtimeType);
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
          child: Row(
            children: [
              Expanded(
                flex: 1,
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
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (await getToken(context) != null) {
                      NavigationHelper.pushPage(context, CreateJobPage());
                    } else {
                      NavigationHelper.pushPage(context, SignInPage());
                    }

                    // FutureBuilder<String?>(
                    //   future: tokenFuture,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState == ConnectionState.done) {
                    //       final String? token = snapshot.data;
                    //
                    //       print('the token is-- $token');
                    //
                    //       return token != null ? CreateJobPage() : SignInPage();
                    //     } else {
                    //       return CircularProgressIndicator();
                    //     }
                    //   },
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightPurpleColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 35,
                    width: 30,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu,
                          color: purpleColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Ihale Ekle',
                          style: TextStyle(
                              color: purpleColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: JobsService.getAllJobsService(token, context),
            builder: (context, snapshot) {
              // var expires_at = snapshot.data![0]['expires_at'];
              // DateTime date = DateTime.fromMillisecondsSinceEpoch(expires_at);
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                shrinkWrap: false,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime dateTime =
                      DateTime.fromMillisecondsSinceEpoch(1707586489146);
                  print('the date time is $dateTime');
                  print(snapshot.data![index]);
                  String title = snapshot.data![index]['title'];
                  String subtitle = snapshot.data![index]['description'];
                  String city = snapshot.data![index]['city'];
                  int numberOfJobsDone =
                      snapshot.data![index]['user']['project_completed'];
                  String coverImage = snapshot.data![index]['cover'];
                  print(numberOfJobsDone);
                  return JobCard(
                    jobImageUrl: coverImage,
                    jobTitle: title,
                    jobSubtitle: subtitle,
                    jobLocation: city,
                    numberOfProposals:
                        snapshot.data![index]['proposals'].length,
                    jobValidityTimeStamp: '',
                    numberOfJobsDoneBefore: numberOfJobsDone,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class JobCard extends StatefulWidget {
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
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool result = false;

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
                image: NetworkImage(widget.jobImageUrl) // Cast to String

                // AssetImage(
                //      'images/default_job_photo.webp'),
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
                this.widget.jobTitle,
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
                this.widget.jobSubtitle,
                overflow: TextOverflow.ellipsis,
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
                      label: this.widget.jobLocation),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                CustomIconWidget(
                    icon: Icons.back_hand_outlined,
                    color: Colors.grey.shade300,
                    label:
                        '${this.widget.numberOfProposals.toString()} teklif aldi'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CustomIconWidget(
                icon: Icons.timelapse,
                color: Colors.grey.shade300,
                label: this.widget.jobValidityTimeStamp),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CustomIconWidget(
                icon: Icons.work,
                color: Colors.grey.shade300,
                label:
                    'daha once ${this.widget.numberOfJobsDoneBefore} islem yapti'),
          ),
          GestureDetector(
            onTap: () async {
              if (await getToken(context) != null) {
                NavigationHelper.pushPage(context, CreateProposalPage());
              } else {
                NavigationHelper.pushPage(context, SignInPage());
              }
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
    return Scaffold(
      backgroundColor: backgroundColor, // Set background color to green
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage('images/placeholder-search-5-dark.png'),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Eşleşen sonuç yok",
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Eski ihaleniz bulunmadı!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
