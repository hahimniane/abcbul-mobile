import '../accepted_jobs_page_screen/widgets/acceptedjobspage_item_widget.dart';
import 'models/accepted_jobs_page_model.dart';
import 'models/acceptedjobspage_item_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'provider/accepted_jobs_page_provider.dart';

class AcceptedJobsPageScreen extends StatefulWidget {
  const AcceptedJobsPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AcceptedJobsPageScreenState createState() => AcceptedJobsPageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AcceptedJobsPageProvider(),
      child: AcceptedJobsPageScreen(),
    );
  }
}

class AcceptedJobsPageScreenState extends State<AcceptedJobsPageScreen> {
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
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "msg_you_ve_been_accepted".tr,
                  style: CustomTextStyles.titleMediumBold,
                ),
              ),
              SizedBox(height: 5.v),
              _buildAcceptedJobsPage(context),
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
        text: "lbl_my_jobs".tr,
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

  /// Section Widget
  Widget _buildAcceptedJobsPage(BuildContext context) {
    return Expanded(
      child: Consumer<AcceptedJobsPageProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 1.v,
              );
            },
            itemCount: provider
                .acceptedJobsPageModelObj.acceptedjobspageItemList.length,
            itemBuilder: (context, index) {
              AcceptedjobspageItemModel model = provider
                  .acceptedJobsPageModelObj.acceptedjobspageItemList[index];
              return AcceptedjobspageItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
