import 'bloc/notification_one_bloc.dart';
import 'models/notification_one_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class NotificationOneScreen extends StatelessWidget {
  const NotificationOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationOneBloc>(
        create: (context) => NotificationOneBloc(NotificationOneState(
            notificationOneModelObj: NotificationOneModel()))
          ..add(NotificationOneInitialEvent()),
        child: NotificationOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationOneBloc, NotificationOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12.v),
                  child: Column(children: [
                    _buildFeed(context,
                        userImage: ImageConstant.imgOffer,
                        userLabel: "lbl_offer".tr, onTapFeed: () {
                      onTapTxtOffer(context);
                    }),
                    _buildFeed(context,
                        userImage: ImageConstant.imgListIcon,
                        userLabel: "lbl_feed".tr, onTapFeed: () {
                      onTapTxtFeed(context);
                    }),
                    SizedBox(height: 5.v),
                    _buildFeed(context,
                        userImage: ImageConstant.imgNotificationIcon,
                        userLabel: "lbl_acivity".tr, onTapFeed: () {
                      onTapTxtAcivity(context);
                    })
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

  /// Common widget
  Widget _buildFeed(
    BuildContext context, {
    required String userImage,
    required String userLabel,
    Function? onTapFeed,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: userImage, height: 24.adaptSize, width: 24.adaptSize),
          GestureDetector(onTap: () {
            onTapFeed!.call();
          }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(userLabel,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the offerScreenOneScreen when the action is triggered.
  onTapTxtOffer(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.offerScreenOneScreen,
    );
  }

  /// Navigates to the notificationFeedScreen when the action is triggered.
  onTapTxtFeed(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationFeedScreen,
    );
  }

  /// Navigates to the orderScreen when the action is triggered.
  onTapTxtAcivity(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.orderScreen,
    );
  }
}
