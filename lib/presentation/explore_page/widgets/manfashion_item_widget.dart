import '../models/manfashion_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ManfashionItemWidget extends StatelessWidget {
  ManfashionItemWidget(
    this.manfashionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ManfashionItemModel manfashionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: manfashionItemModelObj.arrowLeft,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          manfashionItemModelObj.manShirt!,
          style: CustomTextStyles.bodySmall10,
        ),
      ],
    );
  }
}
