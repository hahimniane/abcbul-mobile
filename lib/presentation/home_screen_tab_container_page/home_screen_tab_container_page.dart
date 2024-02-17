import 'models/home_screen_tab_container_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:abcbul/presentation/home_screen_page/home_screen_page.dart';
import 'package:abcbul/widgets/app_bar/appbar_leading_image.dart';
import 'package:abcbul/widgets/app_bar/appbar_title.dart';
import 'package:abcbul/widgets/app_bar/custom_app_bar.dart';
import 'package:abcbul/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/home_screen_tab_container_provider.dart';

// ignore_for_file: must_be_immutable
class HomeScreenTabContainerPage extends StatefulWidget {
  const HomeScreenTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeScreenTabContainerPageState createState() =>
      HomeScreenTabContainerPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenTabContainerProvider(),
      child: HomeScreenTabContainerPage(),
    );
  }
}

class HomeScreenTabContainerPageState extends State<HomeScreenTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
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
            padding: EdgeInsets.only(top: 12.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Selector<HomeScreenTabContainerProvider,
                      TextEditingController?>(
                    selector: (
                      context,
                      provider,
                    ) =>
                        provider.searchController,
                    builder: (context, searchController, child) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "msg_search_for_jobs".tr,
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.v),
                _buildTabview(context),
                SizedBox(
                  height: 916.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      HomeScreenPage.builder(context),
                      HomeScreenPage.builder(context),
                    ],
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
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgDepth4Frame0Onprimary24x24,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 28.v,
          bottom: 20.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_jobs".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 54.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.errorContainer,
            width: 1.h,
          ),
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.onPrimary.withOpacity(1),
        unselectedLabelColor: theme.colorScheme.primaryContainer,
        tabs: [
          Tab(
            child: Text(
              "lbl_active_jobs".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_past_jobs".tr,
            ),
          ),
        ],
      ),
    );
  }
}
