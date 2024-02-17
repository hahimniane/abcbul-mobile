import 'package:flutter/material.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/accepted_jobs_page_screen/models/accepted_jobs_page_model.dart';
import '../models/acceptedjobspage_item_model.dart';

/// A provider class for the AcceptedJobsPageScreen.
///
/// This provider manages the state of the AcceptedJobsPageScreen, including the
/// current acceptedJobsPageModelObj

// ignore_for_file: must_be_immutable
class AcceptedJobsPageProvider extends ChangeNotifier {
  AcceptedJobsPageModel acceptedJobsPageModelObj = AcceptedJobsPageModel();

  @override
  void dispose() {
    super.dispose();
  }
}
