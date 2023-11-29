import 'bloc/review_product_bloc.dart';
import 'models/review_product_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_rating_bar.dart';

class ReviewProductScreen extends StatelessWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReviewProductBloc>(
        create: (context) => ReviewProductBloc(
            ReviewProductState(reviewProductModelObj: ReviewProductModel()))
          ..add(ReviewProductInitialEvent()),
        child: ReviewProductScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ReviewProductBloc, ReviewProductState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 45.v),
                  child: Column(children: [
                    SizedBox(height: 20.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 19.h, right: 23.h, bottom: 5.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 32.adaptSize,
                                                width: 32.adaptSize,
                                                margin: EdgeInsets.only(
                                                    top: 2.v, bottom: 8.v),
                                                decoration: BoxDecoration(
                                                    color: appTheme.blue200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.h))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 32.h),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("lbl_nathaniel".tr,
                                                          style: theme.textTheme
                                                              .titleSmall),
                                                      SizedBox(height: 5.v),
                                                      CustomRatingBar(
                                                          initialRating: 5,
                                                          itemSize: 16)
                                                    ]))
                                          ]),
                                      SizedBox(height: 22.v),
                                      SizedBox(
                                          width: 333.h,
                                          child: Text(
                                              "msg_air_max_are_always".tr,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 14.v),
                                      Text("lbl_sept_10_2023".tr,
                                          style: CustomTextStyles.bodySmall10),
                                      SizedBox(height: 34.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 6.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 32.adaptSize,
                                                    width: 32.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 1.v, bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme.blue200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26.h),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("lbl_haruna".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall),
                                                          SizedBox(height: 4.v),
                                                          CustomRatingBar(
                                                              initialRating: 5,
                                                              itemSize: 16)
                                                        ]))
                                              ])),
                                      SizedBox(height: 22.v),
                                      Container(
                                          width: 317.h,
                                          margin: EdgeInsets.only(right: 15.h),
                                          child: Text(
                                              "msg_this_is_really_amazing".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 13.v),
                                      Text("lbl_sept_10_2023".tr,
                                          style: CustomTextStyles.bodySmall10),
                                      SizedBox(height: 37.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 32.adaptSize,
                                                    width: 32.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme.blue200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18.h),
                                                    child: Column(children: [
                                                      Text(
                                                          "lbl_philip_bortey"
                                                              .tr,
                                                          style: theme.textTheme
                                                              .titleSmall),
                                                      SizedBox(height: 3.v),
                                                      CustomRatingBar(
                                                          initialRating: 5,
                                                          itemSize: 16)
                                                    ]))
                                              ])),
                                      SizedBox(height: 22.v),
                                      SizedBox(
                                          width: 331.h,
                                          child: Text(
                                              "msg_air_max_are_always2".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 13.v),
                                      Text("lbl_set_10_2023".tr,
                                          style: CustomTextStyles.bodySmall10),
                                      SizedBox(height: 26.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 32.adaptSize,
                                                    width: 32.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        bottom: 12.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme.blue200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18.h, top: 3.v),
                                                    child: Column(children: [
                                                      Text(
                                                          "lbl_andy_collins".tr,
                                                          style: theme.textTheme
                                                              .titleSmall),
                                                      SizedBox(height: 3.v),
                                                      CustomRatingBar(
                                                          initialRating: 5,
                                                          itemSize: 16)
                                                    ]))
                                              ])),
                                      SizedBox(height: 22.v),
                                      Container(
                                          width: 317.h,
                                          margin: EdgeInsets.only(right: 15.h),
                                          child: Text(
                                              "msg_this_is_really_amazing".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 13.v),
                                      Text("lbl_sept_10_2023".tr,
                                          style: CustomTextStyles.bodySmall10),
                                      SizedBox(height: 36.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 19.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 32.adaptSize,
                                                    width: 32.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 1.v, bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme.blue200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 13.h),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "lbl_enoch_haruna"
                                                                  .tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall),
                                                          SizedBox(height: 4.v),
                                                          CustomRatingBar(
                                                              initialRating: 5,
                                                              itemSize: 16)
                                                        ]))
                                              ])),
                                      SizedBox(height: 22.v),
                                      SizedBox(
                                          width: 331.h,
                                          child: Text(
                                              "msg_air_max_are_always2".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 14.v),
                                      Text("lbl_sept_10_2023".tr,
                                          style: CustomTextStyles.bodySmall10)
                                    ]))))
                  ])),
              bottomNavigationBar: _buildWriteReview(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 43.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 19.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_5_review".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildWriteReview(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_write_review".tr,
        margin: EdgeInsets.only(left: 19.h, right: 13.h, bottom: 58.v),
        onPressed: () {
          onTapWriteReview(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the writeReviewFillScreen when the action is triggered.
  onTapWriteReview(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.writeReviewFillScreen,
    );
  }
}
