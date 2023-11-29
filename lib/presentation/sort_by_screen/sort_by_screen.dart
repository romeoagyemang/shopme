import 'bloc/sort_by_bloc.dart';
import 'models/sort_by_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class SortByScreen extends StatelessWidget {
  const SortByScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SortByBloc>(
        create: (context) =>
            SortByBloc(SortByState(sortByModelObj: SortByModel()))
              ..add(SortByInitialEvent()),
        child: SortByScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SortByBloc, SortByState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: Column(children: [
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text("lbl_best_match".tr,
                            style: CustomTextStyles.labelLargePrimary_1)),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillBlue,
                        child: Text("msg_time_ending_soonest".tr,
                            style: theme.textTheme.labelLarge)),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text("msg_time_newly_listed".tr,
                            style: theme.textTheme.labelLarge)),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text("msg_price_shipping".tr,
                            style: theme.textTheme.labelLarge)),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text("msg_price_shipping2".tr,
                            style: theme.textTheme.labelLarge)),
                    SizedBox(height: 5.v),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text("msg_distance_nearest".tr,
                            style: theme.textTheme.labelLarge))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_sort_by".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
