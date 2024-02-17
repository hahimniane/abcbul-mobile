import 'models/signup_page_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/core/utils/validation_functions.dart';
import 'package:abcbul/widgets/app_bar/appbar_leading_image.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_drop_down.dart';
import 'package:abcbul/widgets/custom_elevated_button.dart';
import 'package:abcbul/widgets/custom_switch.dart';
import 'package:abcbul/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/signup_page_provider.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupPageScreenState createState() => SignupPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupPageProvider(),
      child: SignupPageScreen(),
    );
  }
}

class SignupPageScreenState extends State<SignupPageScreen> {
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
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(
                  children: [
                    _buildFullName(context),
                    SizedBox(height: 24.v),
                    _buildUserName(context),
                    SizedBox(height: 24.v),
                    _buildEmail(context),
                    SizedBox(height: 24.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 24.v),
                    _buildPassword(context),
                    SizedBox(height: 24.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Selector<SignupPageProvider, SignupPageModel?>(
                        selector: (
                          context,
                          provider,
                        ) =>
                            provider.signupPageModelObj,
                        builder: (context, signupPageModelObj, child) {
                          return CustomDropDown(
                            icon: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                              child: CustomImageView(
                                imagePath: ImageConstant
                                    .imgDepth6Frame1Primarycontainer24x24,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                            ),
                            hintText: "msg_city_state_or_zip".tr,
                            items: signupPageModelObj?.dropdownItemList ?? [],
                            onChanged: (value) {
                              context
                                  .read<SignupPageProvider>()
                                  .onSelected(value);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.v),
                    _buildDepthFrameSeven(context),
                    _buildDepthFrameEight(context),
                    SizedBox(height: 12.v),
                    _buildCreateAccount(context),
                    SizedBox(height: 17.v),
                    Text(
                      "msg_already_have_an".tr,
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
                    SizedBox(height: 7.v),
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
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgDepth4Frame0,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 28.v,
          bottom: 20.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_sign_up".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Selector<SignupPageProvider, TextEditingController?>(
        selector: (
          context,
          provider,
        ) =>
            provider.fullNameController,
        builder: (context, fullNameController, child) {
          return CustomTextFormField(
            controller: fullNameController,
            hintText: "lbl_full_name".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Selector<SignupPageProvider, TextEditingController?>(
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
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Selector<SignupPageProvider, TextEditingController?>(
        selector: (
          context,
          provider,
        ) =>
            provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
            controller: emailController,
            hintText: "lbl_email".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Selector<SignupPageProvider, TextEditingController?>(
        selector: (
          context,
          provider,
        ) =>
            provider.phoneNumberController,
        builder: (context, phoneNumberController, child) {
          return CustomTextFormField(
            controller: phoneNumberController,
            hintText: "lbl_phone_number".tr,
            textInputType: TextInputType.phone,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgDepth6Frame1,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (!isValidPhone(value)) {
                return "err_msg_please_enter_valid_phone_number".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.only(
              left: 16.h,
              top: 16.v,
              bottom: 16.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Consumer<SignupPageProvider>(
        builder: (context, provider, child) {
          return CustomTextFormField(
            controller: provider.passwordController,
            hintText: "lbl_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                provider.changePasswordVisibility();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDepth6Frame1Primarycontainer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 56.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: provider.isShowPassword,
            contentPadding: EdgeInsets.only(
              left: 16.h,
              top: 16.v,
              bottom: 16.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameSeven(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 11.v),
      decoration: AppDecoration.fillGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_i_want_to_create".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "msg_you_can_change_this".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Selector<SignupPageProvider, bool?>(
            selector: (
              context,
              provider,
            ) =>
                provider.isSelectedSwitch,
            builder: (context, isSelectedSwitch, child) {
              return CustomSwitch(
                margin: EdgeInsets.only(
                  top: 9.v,
                  bottom: 8.v,
                ),
                value: isSelectedSwitch,
                onChange: (value) {
                  context.read<SignupPageProvider>().changeSwitchBox1(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameEight(BuildContext context) {
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
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_i_accept_the_terms".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "msg_read_our_terms_and".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 28.adaptSize,
            width: 28.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 9.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_create_account".tr,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
    );
  }
}
