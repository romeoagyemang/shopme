import '../models/productslider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class ProductsliderItemWidget extends StatelessWidget {
  ProductsliderItemWidget(
    this.productsliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductsliderItemModel productsliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgProductImage238x375,
      height: 238.v,
      width: 375.h,
    );
  }
}
