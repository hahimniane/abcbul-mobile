import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/post_job_page/models/post_job_model.dart';
import '../models/depthframefivechipview_item_model.dart';

/// A provider class for the PostJobPage.
///
/// This provider manages the state of the PostJobPage, including the
/// current postJobModelObj

// ignore_for_file: must_be_immutable
class PostJobProvider extends ChangeNotifier {
  TextEditingController titleEditTextController = TextEditingController();

  TextEditingController descriptionEditTextController = TextEditingController();

  TextEditingController timeEditTextController = TextEditingController();

  TextEditingController cityEditTextController = TextEditingController();

  PostJobModel postJobModelObj = PostJobModel();

  @override
  void dispose() {
    super.dispose();
    titleEditTextController.dispose();
    descriptionEditTextController.dispose();
    timeEditTextController.dispose();
    cityEditTextController.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    postJobModelObj.depthframefivechipviewItemList.forEach((element) {
      element.isSelected = false;
    });
    postJobModelObj.depthframefivechipviewItemList[index].isSelected = value;
    notifyListeners();
  }
}
