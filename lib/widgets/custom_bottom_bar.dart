import 'package:abcbul/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavJobs,
      activeIcon: ImageConstant.imgNavJobs,
      title: "lbl_jobs".tr,
      type: BottomBarEnum.Jobs,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProposals,
      activeIcon: ImageConstant.imgNavProposals,
      title: "lbl_proposals".tr,
      type: BottomBarEnum.Proposals,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgSearch,
      title: "lbl_messages".tr,
      type: BottomBarEnum.Messages,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMe,
      activeIcon: ImageConstant.imgNavMe,
      title: "lbl_me".tr,
      type: BottomBarEnum.Me,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.secondaryContainer,
            width: 1.h,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 32.v,
                  width: 24.h,
                  color: theme.colorScheme.primaryContainer,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 32.v,
                  width: 48.h,
                  color: theme.colorScheme.onPrimary.withOpacity(1),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Jobs,
  Proposals,
  Messages,
  Me,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
