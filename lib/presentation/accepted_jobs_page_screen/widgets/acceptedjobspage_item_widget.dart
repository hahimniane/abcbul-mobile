import '../models/acceptedjobspage_item_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AcceptedjobspageItemWidget extends StatelessWidget {
  AcceptedjobspageItemWidget(
    this.acceptedjobspageItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AcceptedjobspageItemModel acceptedjobspageItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: acceptedjobspageItemModelObj?.groceryImage,
            height: 201.v,
            width: 358.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            acceptedjobspageItemModelObj.groceryText!,
            style: CustomTextStyles.titleMediumBold,
          ),
          SizedBox(height: 2.v),
          Text(
            acceptedjobspageItemModelObj.deliveryText!,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 3.v),
          Text(
            acceptedjobspageItemModelObj.daysLeftText!,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 14.v),
        ],
      ),
    );
  }
}
