import 'models/home_screen_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/home_screen_provider.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeScreenPageState createState() => HomeScreenPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: HomeScreenPage(),
    );
  }
}

class HomeScreenPageState extends State<HomeScreenPage>
    with AutomaticKeepAliveClientMixin<HomeScreenPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.v),
                Column(
                  children: [
                    _buildDepthFrameThree(context),
                    SizedBox(height: 12.v),
                    _buildDepthFrameZero(context),
                    _buildDepthFrameZero1(context),
                    CustomElevatedButton(
                      height: 56.v,
                      width: 163.h,
                      text: "lbl_post_a_job".tr,
                      margin: EdgeInsets.only(right: 20.h),
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 16.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgDepth4Frame0Onprimary,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      buttonStyle:
                          CustomButtonStyles.outlineOnSecondaryContainer,
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameThree(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.h,
        right: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 122.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 5.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_software_dev".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          Container(
            width: 78.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_design".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          Container(
            width: 84.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 5.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_product".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameZero(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth5Frame0,
            height: 201.v,
            width: 358.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 16.v),
          Text(
            "msg_seeking_a_product".tr,
            style: CustomTextStyles.titleMediumBold,
          ),
          SizedBox(height: 14.v),
          Row(
            children: [
              Expanded(
                child: Text(
                  "msg_company_a_1_ventures".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 32.v,
                  width: 84.h,
                  text: "lbl_bid".tr,
                  margin: EdgeInsets.only(
                    left: 17.h,
                    top: 38.v,
                  ),
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameZero1(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDepth5Frame0201x358,
            height: 201.v,
            width: 358.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 16.v),
          Text(
            "msg_looking_for_a_senior".tr,
            style: CustomTextStyles.titleMediumBold,
          ),
          SizedBox(height: 14.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "msg_company_b_2_ventures".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 32.v,
                  width: 84.h,
                  text: "lbl_bid".tr,
                  margin: EdgeInsets.only(
                    left: 22.h,
                    top: 38.v,
                  ),
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
