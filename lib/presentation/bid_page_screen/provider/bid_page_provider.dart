import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/bid_page_screen/models/bid_page_model.dart';

/// A provider class for the BidPageScreen.
///
/// This provider manages the state of the BidPageScreen, including the
/// current bidPageModelObj
class BidPageProvider extends ChangeNotifier {
  TextEditingController priceController = TextEditingController();

  TextEditingController hoursvalueController = TextEditingController();

  BidPageModel bidPageModelObj = BidPageModel();

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    hoursvalueController.dispose();
  }
}
