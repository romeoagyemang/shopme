import 'bloc/notification_offer_bloc.dart';
import 'models/notification_offer_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class NotificationOfferScreen extends StatelessWidget {
  const NotificationOfferScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationOfferBloc>(
        create: (context) => NotificationOfferBloc(NotificationOfferState(
            notificationOfferModelObj: NotificationOfferModel()))
          ..add(NotificationOfferInitialEvent()),
        child: NotificationOfferScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationOfferBloc, NotificationOfferState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12.v),
                  child: Column(children: [
                    _buildOfferItem1(context),
                    _buildOfferItem2(context),
                    SizedBox(height: 5.v),
                    _buildOfferItem3(context)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_notification".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildOfferItem1(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOffer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 94.v)),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_the_best_title".tr,
                                style: theme.textTheme.titleSmall),
                            SizedBox(height: 11.v),
                            SizedBox(
                                width: 303.h,
                                child: Text("msg_enjoy_a_scorching".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(height: 1.80))),
                            SizedBox(height: 6.v),
                            Text("msg_sept_30_2023_1_01".tr,
                                style: CustomTextStyles.bodySmallOnPrimary10)
                          ])))
            ]));
  }

  /// Section Widget
  Widget _buildOfferItem2(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOffer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 72.v)),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("msg_summer_offer_98".tr,
                                style: theme.textTheme.titleSmall),
                            SizedBox(height: 10.v),
                            SizedBox(
                                width: 303.h,
                                child: Text("msg_enjoy_a_scorching".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!
                                        .copyWith(height: 1.80)))
                          ])))
            ]));
  }

  /// Section Widget
  Widget _buildOfferItem3(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              Padding(
                  padding: EdgeInsets.only(left: 37.h),
                  child: Text("msg_sept_30_2023_1_01".tr,
                      style: CustomTextStyles.bodySmallOnPrimary10)),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(right: 22.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgOffer,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            margin: EdgeInsets.only(bottom: 96.v)),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 13.h, top: 4.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("msg_special_offer_25".tr,
                                          style: theme.textTheme.titleSmall),
                                      SizedBox(height: 9.v),
                                      SizedBox(
                                          width: 283.h,
                                          child: Text(
                                              "msg_avail_an_exclusive".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.80))),
                                      SizedBox(height: 5.v),
                                      Text("msg_sept_30_2023_1_01".tr,
                                          style: CustomTextStyles
                                              .bodySmallOnPrimary10)
                                    ])))
                      ]))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
