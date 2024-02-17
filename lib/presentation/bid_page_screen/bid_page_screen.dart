import 'models/bid_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:abcbul/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/bid_page_provider.dart';

class BidPageScreen extends StatefulWidget {
  const BidPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  BidPageScreenState createState() => BidPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BidPageProvider(),
      child: BidPageScreen(),
    );
  }
}

class BidPageScreenState extends State<BidPageScreen> {
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
          padding: EdgeInsets.symmetric(vertical: 22.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_how_much_are_you".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Selector<BidPageProvider, TextEditingController?>(
                  selector: (
                    context,
                    provider,
                  ) =>
                      provider.priceController,
                  builder: (context, priceController, child) {
                    return CustomTextFormField(
                      controller: priceController,
                      hintText: "lbl_0_00".tr,
                    );
                  },
                ),
              ),
              SizedBox(height: 32.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "msg_how_long_will_it".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Selector<BidPageProvider, TextEditingController?>(
                  selector: (
                    context,
                    provider,
                  ) =>
                      provider.hoursvalueController,
                  builder: (context, hoursvalueController, child) {
                    return CustomTextFormField(
                      controller: hoursvalueController,
                      hintText: "lbl_hours".tr,
                      textInputAction: TextInputAction.done,
                    );
                  },
                ),
              ),
              SizedBox(height: 12.v),
              _buildDepthFrameFive(context),
              SizedBox(height: 12.v),
              CustomElevatedButton(
                text: "lbl_place_bid".tr,
                margin: EdgeInsets.symmetric(horizontal: 16.h),
              ),
              SizedBox(height: 12.v),
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
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_bid_on_job".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgDepth3Frame2,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 8.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildDepthFrameFive(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Text(
              "lbl_you_ll_be_paid".tr,
              style: CustomTextStyles.bodyLargeOnPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "lbl_0_00".tr,
              style: CustomTextStyles.bodyLargeOnPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
