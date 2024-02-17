import 'models/login_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/core/utils/validation_functions.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:abcbul/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/login_page_provider.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginPageScreenState createState() => LoginPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      child: LoginPageScreen(),
    );
  }
}

class LoginPageScreenState extends State<LoginPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 14.v),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "lbl_username".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child:
                          Selector<LoginPageProvider, TextEditingController?>(
                        selector: (
                          context,
                          provider,
                        ) =>
                            provider.userNameController,
                        builder: (context, userNameController, child) {
                          return CustomTextFormField(
                            controller: userNameController,
                            hintText: "lbl_username".tr,
                            validator: (value) {
                              if (!isText(value)) {
                                return "err_msg_please_enter_valid_text".tr;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 26.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "lbl_password".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child:
                          Selector<LoginPageProvider, TextEditingController?>(
                        selector: (
                          context,
                          provider,
                        ) =>
                            provider.passwordController,
                        builder: (context, passwordController, child) {
                          return CustomTextFormField(
                            controller: passwordController,
                            hintText: "lbl_password".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                            obscureText: true,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.v),
                    _buildDepthFrameZero(context),
                    SizedBox(height: 12.v),
                    CustomElevatedButton(
                      text: "lbl_log_in2".tr,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                    ),
                    SizedBox(height: 17.v),
                    Text(
                      "msg_don_t_have_an_account".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10.v),
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
        text: "lbl_login".tr,
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
  Widget _buildDepthFrameZero(BuildContext context) {
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
              "msg_forgot_password".tr,
              style: CustomTextStyles.bodyLargeOnPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "lbl_reset".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
