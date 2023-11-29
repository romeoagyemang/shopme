import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 18.v),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            height: 77.v,
                            width: 187.h,
                            margin: EdgeInsets.only(left: 25.h),
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgPassport1,
                                      height: 77.adaptSize,
                                      width: 77.adaptSize,
                                      radius: BorderRadius.circular(38.h),
                                      alignment: Alignment.centerLeft),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 5.h),
                                          child: Text("lbl_priscilla_agyei".tr,
                                              style:
                                                  theme.textTheme.titleSmall))),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text("msg_priscillla_agye".tr,
                                          style: theme.textTheme.bodySmall))
                                ]))),
                    SizedBox(height: 45.v),
                    _buildBirthday(context,
                        userImage: ImageConstant.imgGenderIcon,
                        userLabel: "lbl_gender".tr,
                        userBirthDate: "lbl_female".tr),
                    _buildBirthday(context,
                        userImage: ImageConstant.imgDateIcon,
                        userLabel: "lbl_birthday".tr,
                        userBirthDate: "lbl_1_01_2000".tr),
                    _buildBirthday(context,
                        userImage: ImageConstant.imgMailPrimary,
                        userLabel: "lbl_email".tr,
                        userBirthDate: "msg_priscilllaagye_gmail_com".tr),
                    _buildBirthday(context,
                        userImage: ImageConstant.imgCreditCardIcon,
                        userLabel: "lbl_phone_number".tr,
                        userBirthDate: "lbl_0245668654".tr),
                    SizedBox(height: 5.v),
                    _buildBirthday(context,
                        userImage: ImageConstant.imgPasswordIconPrimary,
                        userLabel: "lbl_change_password".tr,
                        userBirthDate: "msg".tr)
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
            text: "lbl_profile".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildBirthday(
    BuildContext context, {
    required String userImage,
    required String userLabel,
    required String userBirthDate,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: userImage, height: 24.adaptSize, width: 24.adaptSize),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 2.v),
              child: Text(userLabel,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1)))),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
              child: Text(userBirthDate,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.blueGray300))),
          CustomImageView(
              imagePath: ImageConstant.imgRightIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
