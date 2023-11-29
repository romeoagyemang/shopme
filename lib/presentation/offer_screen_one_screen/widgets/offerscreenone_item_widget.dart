import '../models/offerscreenone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class OfferscreenoneItemWidget extends StatelessWidget {
  OfferscreenoneItemWidget(
    this.offerscreenoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OfferscreenoneItemModel offerscreenoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineBlue50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: offerscreenoneItemModelObj.image,
            height: 133.adaptSize,
            width: 133.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: 107.h,
            child: Text(
              offerscreenoneItemModelObj.nikeAirMaxReact!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 4.v),
          CustomRatingBar(
            ignoreGestures: true,
            initialRating: 4,
          ),
          SizedBox(height: 17.v),
          Text(
            offerscreenoneItemModelObj.price!,
            style: CustomTextStyles.labelLargePrimary_1,
          ),
          SizedBox(height: 6.v),
          Row(
            children: [
              Text(
                offerscreenoneItemModelObj.price1!,
                style: CustomTextStyles.bodySmall10.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Text(
                  offerscreenoneItemModelObj.offer!,
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
