import '../notification_feed_screen/widgets/notificationfeed_item_widget.dart';
import 'bloc/notification_feed_bloc.dart';
import 'models/notification_feed_model.dart';
import 'models/notificationfeed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class NotificationFeedScreen extends StatelessWidget {
  const NotificationFeedScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationFeedBloc>(
        create: (context) => NotificationFeedBloc(NotificationFeedState(
            notificationFeedModelObj: NotificationFeedModel()))
          ..add(NotificationFeedInitialEvent()),
        child: NotificationFeedScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildNotificationFeed(context),
                  _buildFeedItem(context,
                      productImage: ImageConstant.imgProductImage8,
                      newProduct: "lbl_best_product".tr,
                      nikeAirZoomPegasus: "msg_nike_air_zoom_pegasus2".tr,
                      time: "msg_october_3_2023".tr),
                  SizedBox(height: 5.v),
                  _buildFeedItem(context,
                      productImage: ImageConstant.imgProductImage9,
                      newProduct: "lbl_new_product".tr,
                      nikeAirZoomPegasus: "msg_nike_air_zoom_pegasus2".tr,
                      time: "msg_october_3_2023".tr)
                ]))));
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
            text: "lbl_feed".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildNotificationFeed(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 16.v),
                  child: BlocSelector<NotificationFeedBloc,
                          NotificationFeedState, NotificationFeedModel?>(
                      selector: (state) => state.notificationFeedModelObj,
                      builder: (context, notificationFeedModelObj) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 27.v);
                            },
                            itemCount: notificationFeedModelObj
                                    ?.notificationfeedItemList.length ??
                                0,
                            itemBuilder: (context, index) {
                              NotificationfeedItemModel model =
                                  notificationFeedModelObj
                                          ?.notificationfeedItemList[index] ??
                                      NotificationfeedItemModel();
                              return NotificationfeedItemWidget(model);
                            });
                      })))
        ]));
  }

  /// Common widget
  Widget _buildFeedItem(
    BuildContext context, {
    required String productImage,
    required String newProduct,
    required String nikeAirZoomPegasus,
    required String time,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: productImage,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(5.h),
              margin: EdgeInsets.only(bottom: 40.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(newProduct,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        SizedBox(height: 6.v),
                        SizedBox(
                            width: 269.h,
                            child: Text(nikeAirZoomPegasus,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: appTheme.blueGray300,
                                    height: 1.80))),
                        SizedBox(height: 1.v),
                        Text(time,
                            style: CustomTextStyles.bodySmallOnPrimary10
                                .copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1)))
                      ])))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
