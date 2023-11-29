import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AppbarTitleEdittext extends StatelessWidget {
  AppbarTitleEdittext({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomTextFormField(
        width: 263.h,
        controller: controller,
        hintText: "lbl_nike_air_max".tr,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 12.v, 8.h, 14.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 16.adaptSize,
            width: 16.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineBlue,
        filled: false,
      ),
    );
  }
}
