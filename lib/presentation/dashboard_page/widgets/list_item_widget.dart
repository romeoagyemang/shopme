import '../models/list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {
  ListItemWidget(
    this.listItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListItemModel listItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.v),
      padding: EdgeInsets.symmetric(vertical: 1.v),
      width: 72.h,
      child: Column(
        children: [
          CustomIconButton(
            height: 70.adaptSize,
            width: 70.adaptSize,
            padding: EdgeInsets.all(23.h),
            child: CustomImageView(
              imagePath: listItemModelObj.arrowLeft,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            listItemModelObj.manShirt!,
            style: CustomTextStyles.bodySmall10,
          ),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }
}
