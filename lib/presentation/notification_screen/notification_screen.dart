import 'bloc/notification_bloc.dart';
import 'models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
            NotificationState(notificationModelObj: NotificationModel()))
          ..add(NotificationInitialEvent()),
        child: NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  child: Column(children: [
                    _buildActivityDetails1(context),
                    _buildActivityDetails2(context),
                    SizedBox(height: 5.v),
                    _buildActivityDetails3(context)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_activity".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildActivityDetails1(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgMaximize,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(bottom: 94.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("msg_transaction_nike".tr,
                            style: theme.textTheme.titleSmall),
                        SizedBox(height: 10.v),
                        SizedBox(
                            width: 297.h,
                            child: Text("msg_step_into_greatness".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(height: 1.80))),
                        SizedBox(height: 5.v),
                        Text("msg_november_05_2023".tr,
                            style: CustomTextStyles.bodySmallOnPrimary10)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildActivityDetails2(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgMaximize,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(bottom: 93.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(children: [
                    Container(
                        width: 291.h,
                        margin: EdgeInsets.only(right: 7.h),
                        child: Text("msg_transaction_nike2".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall!
                                .copyWith(height: 1.50))),
                    SizedBox(
                        width: 299.h,
                        child: Text("msg_step_into_style".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall!
                                .copyWith(height: 1.80))),
                    SizedBox(height: 5.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("msg_november_05_2023".tr,
                            style: CustomTextStyles.bodySmallOnPrimary10))
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildActivityDetails3(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgMaximize,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(bottom: 94.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("msg_transaction_nike3".tr,
                            style: theme.textTheme.titleSmall),
                        SizedBox(height: 10.v),
                        SizedBox(
                            width: 285.h,
                            child: Text("msg_walk_with_confidence".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(height: 1.80))),
                        SizedBox(height: 27.v),
                        Text("msg_november_05_2023".tr,
                            style: CustomTextStyles.bodySmallOnPrimary10)
                      ])))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
