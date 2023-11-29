import '../models/creditcardslider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class CreditcardsliderItemWidget extends StatelessWidget {
  CreditcardsliderItemWidget(
    this.creditcardsliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CreditcardsliderItemModel creditcardsliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 7.v),
          CustomImageView(
            imagePath: ImageConstant.imgCreditCardLogo,
            height: 22.v,
            width: 36.h,
            margin: EdgeInsets.only(left: 8.h),
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Text(
              "msg_6326_9124".tr,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: 17.v),
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      "lbl_card_holder2".tr,
                      style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 37.h),
                    child: Text(
                      "lbl_card_save".tr,
                      style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              Text(
                "lbl_priscilla_agyei".tr,
                style: CustomTextStyles.labelMediumOnPrimaryContainer,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.h),
                child: Text(
                  "lbl_06_24".tr,
                  style: CustomTextStyles.labelMediumOnPrimaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
