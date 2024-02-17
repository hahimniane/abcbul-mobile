import 'models/notification_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/notification_page_provider.dart';

class NotificationPageScreen extends StatefulWidget {
  const NotificationPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  NotificationPageScreenState createState() => NotificationPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationPageProvider(),
      child: NotificationPageScreen(),
    );
  }
}

class NotificationPageScreenState extends State<NotificationPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 12.v),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Selector<NotificationPageProvider,
                      TextEditingController?>(
                    selector: (
                      context,
                      provider,
                    ) =>
                        provider.searchController,
                    builder: (context, searchController, child) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "lbl_search_jobs".tr,
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.v),
                // _buildSearchView(context),
                // _buildDepthFrameTwo(context),
                _buildDepthFrameThree(context),
                _buildDepthFrameFour(context),
                _buildDepthFrameFive(context),
                _buildDepthFrameSix(context),
                _buildDepthFrameSeven(context),
                SizedBox(height: 83.v),
                Container(
                  height: 20.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                SizedBox(height: 5.v),
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
        text: "lbl_notifications".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgDepth3Frame2Onprimary,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 8.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  // /// Section Widget
  // Widget _buildSearchView(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 15.h,
  //       vertical: 8.v,
  //     ),
  //     decoration: AppDecoration.fillGray,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         CustomImageView(
  //           imagePath: ImageConstant.imgDepth3Frame056x56,
  //           height: 56.adaptSize,
  //           width: 56.adaptSize,
  //           radius: BorderRadius.circular(
  //             28.h,
  //           ),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               left: 16.h,
  //               top: 8.v,
  //               bottom: 4.v,
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "msg_you_have_been_accepted".tr,
  //                   style: theme.textTheme.titleMedium,
  //                 ),
  //                 Text(
  //                   "msg_deadline_12_12_22".tr,
  //                   style: theme.textTheme.bodyMedium,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 26.h,
  //             top: 18.v,
  //             bottom: 16.v,
  //           ),
  //           child: Text(
  //             "lbl_9_2_22".tr,
  //             style: theme.textTheme.bodyMedium,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildDepthFrameTwo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 5.v),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame01,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 7.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_product_manager".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "msg_can_you_believe".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 25.v,
              bottom: 23.v,
            ),
            child: Text(
              "lbl_6_17_22".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame02,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 4.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_ava_martinez_avamart".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 1.v),
                  Text(
                    "msg_let_s_stay_in_touch".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 23.h,
              top: 23.v,
              bottom: 20.v,
            ),
            child: Text(
              "lbl_7_30_21".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameFour(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame03,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 8.v,
                bottom: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_you_have_been_accepted2".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "msg_deadline_10_10_22".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22.h,
              top: 18.v,
              bottom: 16.v,
            ),
            child: Text(
              "lbl_7_6_21".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameFive(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame04,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 5.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_liam_davis_lililil3".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 1.v),
                Text(
                  "msg_they_ran_out_of".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 18.v,
              bottom: 16.v,
            ),
            child: Text(
              "lbl_2_22_21".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameSix(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame05,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 9.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 7.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_mia_rodriguez_m_rodriguez".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "msg_you_re_so_inspiring".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 23.h,
              top: 28.v,
              bottom: 25.v,
            ),
            child: Text(
              "lbl_11_23_19".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameSeven(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth3Frame06,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 9.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_ladies_group".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "msg_hello_we_re_looking".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 27.h,
              top: 28.v,
              bottom: 25.v,
            ),
            child: Text(
              "lbl_11_23_18".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
