import 'models/proposals_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'provider/proposals_page_provider.dart';

class ProposalsPageScreen extends StatefulWidget {
  const ProposalsPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProposalsPageScreenState createState() => ProposalsPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProposalsPageProvider(),
      child: ProposalsPageScreen(),
    );
  }
}

class ProposalsPageScreenState extends State<ProposalsPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            decoration: AppDecoration.fillGray,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context),
                _buildDepthFrameFive(
                  context,
                  jobTitle: "msg_senior_ui_ux_designer".tr,
                  duration: "msg_sent_4_hours_ago".tr,
                ),
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_not_viewed_yet".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Container(
                      height: 8.v,
                      width: 358.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: theme.colorScheme.errorContainer,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.onPrimary.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_2_of_4_steps_completed".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 14.v),
                _buildDepthFrameThree(context),
                SizedBox(height: 16.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_viewed".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 11.v),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8.v,
                    width: 358.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary.withOpacity(1),
                      borderRadius: BorderRadius.circular(
                        4.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_3_of_3_steps_completed".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 14.v),
                _buildDepthFrameFive(
                  context,
                  jobTitle: "msg_senior_ux_ui_designer".tr,
                  duration: "lbl_sent_5_days_ago".tr,
                ),
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_not_viewed_yet".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Container(
                      height: 8.v,
                      width: 358.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.25,
                          backgroundColor: theme.colorScheme.errorContainer,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.onPrimary.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_1_of_4_steps_completed".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Spacer(),
                SizedBox(height: 75.v),
                Container(
                  height: 20.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_proposals".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgDepth4Frame0Onprimary24x24,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 8.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildDepthFrameThree(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame08,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 7.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_senior_product_designer".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "lbl_sent_1_day_ago".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDepthFrameFive(
    BuildContext context, {
    required String jobTitle,
    required String duration,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame09,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 7.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1),
                  ),
                ),
                Text(
                  duration,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
