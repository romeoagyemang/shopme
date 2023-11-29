import '../models/recommendedlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class RecommendedlistItemWidget extends StatelessWidget {
  RecommendedlistItemWidget(
    this.recommendedlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecommendedlistItemModel recommendedlistItemModelObj;

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
            imagePath: recommendedlistItemModelObj.image,
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
              recommendedlistItemModelObj.fSNikeAirMax!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            recommendedlistItemModelObj.price!,
            style: CustomTextStyles.labelLargePrimary_1,
          ),
          SizedBox(height: 9.v),
          Row(
            children: [
              Text(
                recommendedlistItemModelObj.oldPrice!,
                style: CustomTextStyles.bodySmall10.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  recommendedlistItemModelObj.offer!,
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
