import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/subscription_expired_page_screen/models/subscription_expired_page_model.dart';

/// A provider class for the SubscriptionExpiredPageScreen.
///
/// This provider manages the state of the SubscriptionExpiredPageScreen, including the
/// current subscriptionExpiredPageModelObj
class SubscriptionExpiredPageProvider extends ChangeNotifier {
  SubscriptionExpiredPageModel subscriptionExpiredPageModelObj =
      SubscriptionExpiredPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
