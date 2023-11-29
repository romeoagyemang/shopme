import '../models/orderdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class OrderdetailsItemWidget extends StatelessWidget {
  OrderdetailsItemWidget(
    this.orderdetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OrderdetailsItemModel orderdetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: orderdetailsItemModelObj.nikeAirfaintglu,
            height: 72.adaptSize,
            width: 72.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              children: [
                SizedBox(
                  width: 227.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Text(
                          orderdetailsItemModelObj.nikeAirZoomPegasus!,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: orderdetailsItemModelObj.nikeAirfaintglu1,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgTrashIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(left: 8.h),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.v),
                SizedBox(
                  width: 227.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        orderdetailsItemModelObj.price!,
                        style: CustomTextStyles.labelLargePrimary_1,
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgMenu,
                        height: 20.v,
                        width: 33.h,
                      ),
                      SizedBox(
                        height: 20.v,
                        width: 41.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 20.v,
                                width: 41.h,
                                decoration: BoxDecoration(
                                  color: appTheme.blue50,
                                  border: Border.all(
                                    color: appTheme.blue50,
                                    width: 1.h,
                                    strokeAlign: strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 17.h),
                                  child: Text(
                                    orderdetailsItemModelObj.one!,
                                    style: CustomTextStyles.bodySmallOnPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgPlus,
                        height: 20.v,
                        width: 33.h,
                      ),
                    ],
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
