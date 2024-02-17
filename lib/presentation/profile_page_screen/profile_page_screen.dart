import 'models/profile_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_leading_image.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/profile_page_provider.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfilePageScreenState createState() => ProfilePageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfilePageProvider(),
      child: ProfilePageScreen(),
    );
  }
}

class ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgDepth5Frame0128x128,
                  height: 128.adaptSize,
                  width: 128.adaptSize,
                  radius: BorderRadius.circular(
                    64.h,
                  ),
                  margin: EdgeInsets.only(left: 16.h),
                ),
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_samantha_hall".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_san_francisco_ca".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_joined_in_2019".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 36.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_details".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildProfileDetails(context),
                _buildTimezone(
                  context,
                  timezoneText: "lbl_languages".tr,
                  pstText: "lbl_english".tr,
                ),
                _buildTimezone(
                  context,
                  timezoneText: "lbl_timezone".tr,
                  pstText: "lbl_pst".tr,
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_account_actions".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildAccountActions(context),
                SizedBox(height: 21.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_delete_account".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 15.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "msg_you_can_delete_your".tr,
                    style: CustomTextStyles.bodyLargeOnPrimary,
                  ),
                ),
                SizedBox(height: 25.v),
                _buildDeleteAccount(context),
                SizedBox(height: 12.v),
                Container(
                  height: 20.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: appTheme.gray900,
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
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgDepth4Frame0,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 16.v,
          bottom: 8.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_profile".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildProfileDetails(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            "lbl_about".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 1.v),
          Text(
            "msg_samanthahall_gmail_com".tr,
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            "msg_i_m_a_software_engineer".tr,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAccountActions(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 2.v,
            ),
            child: Text(
              "lbl_logout".tr,
              style: CustomTextStyles.bodyLargeOnPrimary,
            ),
          ),
          CustomElevatedButton(
            height: 32.v,
            width: 89.h,
            text: "lbl_sign_out".tr,
            buttonStyle: CustomButtonStyles.fillSecondaryContainer,
            buttonTextStyle: theme.textTheme.titleSmall!,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDeleteAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 116.h,
          vertical: 12.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Container(
          width: 124.h,
          decoration: AppDecoration.fillGray,
          child: Text(
            "lbl_delete_account".tr,
            style: CustomTextStyles.titleMediumBold_1,
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildTimezone(
    BuildContext context, {
    required String timezoneText,
    required String pstText,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            timezoneText,
            style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(1),
            ),
          ),
          Text(
            pstText,
            style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }
}
