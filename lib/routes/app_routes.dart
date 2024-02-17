import 'package:flutter/material.dart';
import 'package:abcbul/presentation/login_page_screen/login_page_screen.dart';
import 'package:abcbul/presentation/signup_page_screen/signup_page_screen.dart';
import 'package:abcbul/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:abcbul/presentation/bid_page_screen/bid_page_screen.dart';
import 'package:abcbul/presentation/profile_page_screen/profile_page_screen.dart';
import 'package:abcbul/presentation/notification_page_screen/notification_page_screen.dart';
import 'package:abcbul/presentation/proposals_page_screen/proposals_page_screen.dart';
import 'package:abcbul/presentation/accepted_jobs_page_screen/accepted_jobs_page_screen.dart';
import 'package:abcbul/presentation/subscription_expired_page_screen/subscription_expired_page_screen.dart';
import 'package:abcbul/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginPageScreen = '/login_page_screen';

  static const String signupPageScreen = '/signup_page_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenTabContainerPage =
      '/home_screen_tab_container_page';

  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String postJobPage = '/post_job_page';

  static const String bidPageScreen = '/bid_page_screen';

  static const String profilePageScreen = '/profile_page_screen';

  static const String notificationPageScreen = '/notification_page_screen';

  static const String proposalsPageScreen = '/proposals_page_screen';

  static const String acceptedJobsPageScreen = '/accepted_jobs_page_screen';

  static const String subscriptionExpiredPageScreen =
      '/subscription_expired_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loginPageScreen: LoginPageScreen.builder,
        signupPageScreen: SignupPageScreen.builder,
        homeScreenContainerScreen: HomeScreenContainerScreen.builder,
        bidPageScreen: BidPageScreen.builder,
        profilePageScreen: ProfilePageScreen.builder,
        notificationPageScreen: NotificationPageScreen.builder,
        proposalsPageScreen: ProposalsPageScreen.builder,
        acceptedJobsPageScreen: AcceptedJobsPageScreen.builder,
        subscriptionExpiredPageScreen: SubscriptionExpiredPageScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
