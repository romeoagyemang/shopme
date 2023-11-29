import '../models/searchresultone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class SearchresultoneItemWidget extends StatelessWidget {
  SearchresultoneItemWidget(
    this.searchresultoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SearchresultoneItemModel searchresultoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineBlue50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: searchresultoneItemModelObj.image,
            height: 94.v,
            width: 120.h,
            alignment: Alignment.center,
          ),
          SizedBox(height: 51.v),
          SizedBox(
            width: 107.h,
            child: Text(
              searchresultoneItemModelObj.nikeAirMaxReact!,
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
          SizedBox(height: 18.v),
          Text(
            searchresultoneItemModelObj.price!,
            style: CustomTextStyles.labelLargePrimary_1,
          ),
          SizedBox(height: 5.v),
          Row(
            children: [
              Text(
                searchresultoneItemModelObj.oldPrice!,
                style: CustomTextStyles.bodySmall10.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  searchresultoneItemModelObj.offer!,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.v),
        ],
      ),
    );
  }
}
