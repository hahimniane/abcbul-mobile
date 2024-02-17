import '../models/depthframefivechipview_item_model.dart';
import 'package:abcbul/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DepthframefivechipviewItemWidget extends StatelessWidget {
  DepthframefivechipviewItemWidget(
    this.depthframefivechipviewItemModelObj, {
    Key? key,
    this.onSelectedChipView1,
  }) : super(
          key: key,
        );

  DepthframefivechipviewItemModel depthframefivechipviewItemModelObj;

  Function(bool)? onSelectedChipView1;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 12.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          depthframefivechipviewItemModelObj.open!,
          style: TextStyle(
            color: theme.colorScheme.onPrimary.withOpacity(1),
            fontSize: 14.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: (depthframefivechipviewItemModelObj.isSelected ?? false),
        backgroundColor: Colors.transparent,
        selectedColor: theme.colorScheme.onPrimary,
        shape: (depthframefivechipviewItemModelObj.isSelected ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.errorContainer,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  12.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.errorContainer,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  12.h,
                ),
              ),
        onSelected: (value) {
          onSelectedChipView1?.call(value);
        },
      ),
    );
  }
}
