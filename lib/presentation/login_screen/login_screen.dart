import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/core/utils/validation_functions.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_icon_button.dart';
import 'package:shopme/widgets/custom_outlined_button.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';
import 'package:shopme/domain/googleauth/google_auth_helper.dart';
import 'package:shopme/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                              height: 72.adaptSize,
                              width: 72.adaptSize,
                              padding: EdgeInsets.all(20.h),
                              decoration: IconButtonStyleHelper.fillPrimaryTL16,
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLogo)),
                          SizedBox(height: 16.v),
                          Text("msg_welcome_to_e_com".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 10.v),
                          Text("msg_sign_in_to_continue".tr,
                              style: theme.textTheme.bodySmall),
                          SizedBox(height: 28.v),
                          _buildEmail(context),
                          SizedBox(height: 10.v),
                          _buildPassword(context),
                          SizedBox(height: 16.v),
                          _buildSignIn(context),
                          SizedBox(height: 18.v),
                          _buildOrLine(context),
                          SizedBox(height: 16.v),
                          _buildLoginWithGoogle(context),
                          SizedBox(height: 8.v),
                          _buildLoginWithFacebook(context),
                          SizedBox(height: 13.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtForgotPassword(context);
                              },
                              child: Text("msg_forgot_password".tr,
                                  style: CustomTextStyles.labelLargePrimary_1)),
                          SizedBox(height: 11.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: theme.textTheme.bodySmall),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_register".tr,
                                        style:
                                            CustomTextStyles.labelLargePrimary)
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_your_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgMail,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgPasswordIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true,
              contentPadding:
                  EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
        });
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_in".tr,
        onPressed: () {
          onTapSignIn(context);
        });
  }

  /// Section Widget
  Widget _buildOrLine(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 10.v, bottom: 9.v),
          child: SizedBox(width: 134.h, child: Divider())),
      Text("lbl_or".tr, style: CustomTextStyles.titleSmallBluegray300_1),
      Padding(
          padding: EdgeInsets.only(top: 10.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()))
    ]);
  }

  /// Section Widget
  Widget _buildLoginWithGoogle(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_login_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogleIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        onPressed: () {
          onTapLoginWithGoogle(context);
        });
  }

  /// Section Widget
  Widget _buildLoginWithFacebook(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_login_with_facebook".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgFacebookIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        onPressed: () {
          onTapLoginWithFacebook(context);
        });
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.

  /// If the sign-in is successful, the [onSuccess] callback will be called with

  /// If the sign-in fails, the [onError] callback will be called with the error message.

  /// Throws an exception if the Google sign-in process fails.

  onTapLoginWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapLoginWithFacebook(BuildContext context) async {
    await FacebookAuthHelper()
        .facebookSignInProcess()
        .then((facebookUser) {})
        .catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.changePasswordScreen,
    );
  }

  /// Navigates to the registerFormScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerFormScreen,
    );
  }
}
