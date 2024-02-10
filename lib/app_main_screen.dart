import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const.dart';
import 'home_page.dart';
import 'job.dart';
import 'notification.dart';
import 'profile.dart'; // Assuming these are local files
import 'proposals.dart';
import 'services/login_services/login_model_class.dart';
import 'services/provider_for_logged_in_user.dart';

/// Represents the main screen of the application.
class AppMainScreen extends StatefulWidget {
  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  /// List of bottom navigation bar items for logged-in users.
  List<BottomNavigationBarItem> loggedInItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'İş',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.description),
      label: 'Teklif',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Ana Sayfa',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Bildirimler',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  /// List of bottom navigation bar items for not logged-in users.
  List<BottomNavigationBarItem> notLoggedInItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Ana Sayfa',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  /// Index of the bottom navigation bar when the user is logged in.
  int loggedInIndex = 2;

  /// Index of the bottom navigation bar when the user is not logged in.
  int notLoggedInIndex = 0;

  /// Pages for not signed-in users.
  final List<Widget> notLoggedInPages = [
    HomePage(),
    ProfilePage(),
  ];

  /// Pages for signed-in users.
  final List<Widget> loggedInPages = [
    JobPage(),
    ProposalPage(),
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Retrieves user response from the UserSessionProvider.
    LoginApiResponse? userResponse =
        context.read<UserSessionProvider>().loginApiResponse;

    return Scaffold(
      body: userResponse?.user != null
          ? loggedInPages[loggedInIndex]
          : notLoggedInPages[notLoggedInIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purpleColor,
        currentIndex:
            userResponse?.user != null ? loggedInIndex : notLoggedInIndex,
        type: BottomNavigationBarType.fixed,
        items: userResponse?.user != null ? loggedInItems : notLoggedInItems,
        onTap: (index) {
          setState(() {
            userResponse?.user != null
                ? loggedInIndex = index
                : notLoggedInIndex = index;
          });
        },
      ),
    );
  }
}
