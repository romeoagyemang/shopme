import '../models/addresslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class AddresslistItemWidget extends StatelessWidget {
  AddresslistItemWidget(
    this.addresslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AddresslistItemModel addresslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23.h),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addresslistItemModelObj.priscekila!,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 17.v),
          SizedBox(
            width: 171.h,
            child: Text(
              addresslistItemModelObj.address!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.80,
              ),
            ),
          ),
          SizedBox(height: 14.v),
          Text(
            addresslistItemModelObj.mobileNumber!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 19.v),
          Row(
            children: [
              Text(
                addresslistItemModelObj.edit!,
                style: CustomTextStyles.titleSmallPrimary,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text(
                  addresslistItemModelObj.delete!,
                  style: CustomTextStyles.titleSmallPink300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
