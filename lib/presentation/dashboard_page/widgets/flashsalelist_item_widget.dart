import '../models/flashsalelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class FlashsalelistItemWidget extends StatelessWidget {
  FlashsalelistItemWidget(
    this.flashsalelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FlashsalelistItemModel flashsalelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.v),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      width: 141.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 18.v),
          SizedBox(
            height: 133.v,
            width: 139.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 105.h,
                    child: Text(
                      flashsalelistItemModelObj.fSNikeAirMax!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: flashsalelistItemModelObj.image,
                  height: 111.v,
                  width: 139.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Text(
              flashsalelistItemModelObj.price!,
              style: CustomTextStyles.labelLargePrimary_1,
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Row(
              children: [
                Text(
                  flashsalelistItemModelObj.oldPrice!,
                  style: CustomTextStyles.bodySmall10.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    flashsalelistItemModelObj.offer!,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
