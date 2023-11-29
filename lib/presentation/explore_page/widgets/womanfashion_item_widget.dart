import '../models/womanfashion_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class WomanfashionItemWidget extends StatelessWidget {
  WomanfashionItemWidget(
    this.womanfashionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  WomanfashionItemModel womanfashionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: womanfashionItemModelObj?.dressIcon,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          womanfashionItemModelObj.dress!,
          style: CustomTextStyles.bodySmall10,
        ),
      ],
    );
  }
}
