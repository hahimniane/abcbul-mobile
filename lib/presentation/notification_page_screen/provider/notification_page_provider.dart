import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/notification_page_screen/models/notification_page_model.dart';

/// A provider class for the NotificationPageScreen.
///
/// This provider manages the state of the NotificationPageScreen, including the
/// current notificationPageModelObj
class NotificationPageProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  NotificationPageModel notificationPageModelObj = NotificationPageModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
