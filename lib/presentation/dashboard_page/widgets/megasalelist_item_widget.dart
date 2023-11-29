import '../models/megasalelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class MegasalelistItemWidget extends StatelessWidget {
  MegasalelistItemWidget(
    this.megasalelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MegasalelistItemModel megasalelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      width: 141.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: megasalelistItemModelObj.image,
            height: 109.adaptSize,
            width: 109.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(height: 7.v),
          SizedBox(
            width: 105.h,
            child: Text(
              megasalelistItemModelObj.mSNikeAirMax!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            megasalelistItemModelObj.price!,
            style: CustomTextStyles.labelLargePrimary_1,
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              Text(
                megasalelistItemModelObj.oldPrice!,
                style: CustomTextStyles.bodySmall10.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Text(
                  megasalelistItemModelObj.offer!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
