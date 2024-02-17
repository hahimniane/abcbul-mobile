import 'models/subscription_expired_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_leading_image.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/subscription_expired_page_provider.dart';

class SubscriptionExpiredPageScreen extends StatefulWidget {
  const SubscriptionExpiredPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SubscriptionExpiredPageScreenState createState() =>
      SubscriptionExpiredPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionExpiredPageProvider(),
      child: SubscriptionExpiredPageScreen(),
    );
  }
}

class SubscriptionExpiredPageScreenState
    extends State<SubscriptionExpiredPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_you_no_longer_have".tr,
                    style: CustomTextStyles.bodyLargeOnPrimary,
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              CustomElevatedButton(
                text: "lbl_renew_plan".tr,
                margin: EdgeInsets.symmetric(horizontal: 16.h),
              ),
              SizedBox(height: 17.v),
              Text(
                "msg_payment_will_be".tr,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 9.v),
              Container(
                height: 20.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.gray900,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgDepth3Frame2,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 28.v,
          bottom: 20.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "msg_your_plan_has_expired".tr,
      ),
      styleType: Style.bgFill,
    );
  }
}
