import 'bloc/lailyfa_febrina_card_bloc.dart';
import 'models/lailyfa_febrina_card_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';

class LailyfaFebrinaCardScreen extends StatelessWidget {
  const LailyfaFebrinaCardScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LailyfaFebrinaCardBloc>(
        create: (context) => LailyfaFebrinaCardBloc(LailyfaFebrinaCardState(
            lailyfaFebrinaCardModelObj: LailyfaFebrinaCardModel()))
          ..add(LailyfaFebrinaCardInitialEvent()),
        child: LailyfaFebrinaCardScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 50.v),
                child: Column(children: [
                  SizedBox(height: 8.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.h, right: 15.h, bottom: 5.v),
                              child: Column(children: [
                                _buildCreditCard(context),
                                SizedBox(height: 23.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("lbl_card_number".tr,
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 12.v),
                                _buildCardNumberEditText(context),
                                SizedBox(height: 24.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("lbl_expiration_date".tr,
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 11.v),
                                _buildExpirationDateEditText(context),
                                SizedBox(height: 29.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("lbl_security_code".tr,
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 11.v),
                                _buildSecurityCodeEditText(context),
                                SizedBox(height: 23.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("lbl_card_holder".tr,
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 12.v),
                                _buildCardHolderNameEditText(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildSaveButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 4.v, bottom: 25.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "msg_amponsah_andrews".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCreditCard(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 23.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgCredtiCardLogo,
                  height: 22.v,
                  width: 36.h,
                  margin: EdgeInsets.only(left: 3.h)),
              SizedBox(height: 30.v),
              Text("msg_6326_9124".tr, style: theme.textTheme.headlineSmall),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(right: 84.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                            opacity: 0.5,
                            child: Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Text("lbl_card_holder2".tr,
                                    style: CustomTextStyles
                                        .bodySmallOnPrimaryContainer10))),
                        Opacity(
                            opacity: 0.5,
                            child: Text("lbl_card_save".tr,
                                style: CustomTextStyles
                                    .bodySmallOnPrimaryContainer10))
                      ])),
              SizedBox(height: 1.v),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text("lbl_andy_collins2".tr,
                        style: CustomTextStyles.labelMediumOnPrimaryContainer)),
                Padding(
                    padding: EdgeInsets.only(left: 88.h, bottom: 3.v),
                    child: Text("lbl_06_24".tr,
                        style: CustomTextStyles.labelMediumOnPrimaryContainer))
              ])
            ]));
  }

  /// Section Widget
  Widget _buildCardNumberEditText(BuildContext context) {
    return BlocSelector<LailyfaFebrinaCardBloc, LailyfaFebrinaCardState,
            TextEditingController?>(
        selector: (state) => state.cardNumberEditTextController,
        builder: (context, cardNumberEditTextController) {
          return CustomTextFormField(
              controller: cardNumberEditTextController,
              hintText: "msg_1231_2312_3123".tr,
              hintStyle: CustomTextStyles.labelLargeBluegray300SemiBold);
        });
  }

  /// Section Widget
  Widget _buildExpirationDateEditText(BuildContext context) {
    return BlocSelector<LailyfaFebrinaCardBloc, LailyfaFebrinaCardState,
            TextEditingController?>(
        selector: (state) => state.expirationDateEditTextController,
        builder: (context, expirationDateEditTextController) {
          return CustomTextFormField(
              controller: expirationDateEditTextController,
              hintText: "lbl_12_12".tr,
              hintStyle: CustomTextStyles.labelLargeBluegray300SemiBold);
        });
  }

  /// Section Widget
  Widget _buildSecurityCodeEditText(BuildContext context) {
    return BlocSelector<LailyfaFebrinaCardBloc, LailyfaFebrinaCardState,
            TextEditingController?>(
        selector: (state) => state.securityCodeEditTextController,
        builder: (context, securityCodeEditTextController) {
          return CustomTextFormField(
              controller: securityCodeEditTextController,
              hintText: "lbl_1219".tr,
              hintStyle: CustomTextStyles.labelLargeBluegray300SemiBold);
        });
  }

  /// Section Widget
  Widget _buildCardHolderNameEditText(BuildContext context) {
    return BlocSelector<LailyfaFebrinaCardBloc, LailyfaFebrinaCardState,
            TextEditingController?>(
        selector: (state) => state.cardHolderNameEditTextController,
        builder: (context, cardHolderNameEditTextController) {
          return CustomTextFormField(
              controller: cardHolderNameEditTextController,
              hintText: "lbl_lailyfa_febrina".tr,
              hintStyle: CustomTextStyles.labelLargeBluegray300SemiBold,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapSaveButton(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the creditCardAndDebitScreen when the action is triggered.
  onTapSaveButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.creditCardAndDebitScreen,
    );
  }
}
