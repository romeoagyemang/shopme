import 'bloc/register_form_bloc.dart';
import 'models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/core/utils/validation_functions.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_icon_button.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterFormScreen extends StatelessWidget {
  RegisterFormScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterFormBloc>(
        create: (context) => RegisterFormBloc(
            RegisterFormState(registerFormModelObj: RegisterFormModel()))
          ..add(RegisterFormInitialEvent()),
        child: RegisterFormScreen());
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
                          Text("msg_let_s_get_started".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 9.v),
                          Text("msg_create_an_new_account".tr,
                              style: theme.textTheme.bodySmall),
                          SizedBox(height: 30.v),
                          _buildFullName(context),
                          SizedBox(height: 8.v),
                          _buildEmail(context),
                          SizedBox(height: 8.v),
                          _buildPassword(context),
                          SizedBox(height: 8.v),
                          _buildPassword1(context),
                          SizedBox(height: 20.v),
                          _buildSignUp(context),
                          SizedBox(height: 20.v),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_have_an_account2".tr,
                                    style: theme.textTheme.bodySmall),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "lbl_sign_in".tr,
                                    style: CustomTextStyles.labelLargePrimary)
                              ]),
                              textAlign: TextAlign.left)
                        ])))));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return BlocSelector<RegisterFormBloc, RegisterFormState,
            TextEditingController?>(
        selector: (state) => state.fullNameController,
        builder: (context, fullNameController) {
          return CustomTextFormField(
              controller: fullNameController,
              hintText: "lbl_full_name".tr,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNavAccount,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v));
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<RegisterFormBloc, RegisterFormState,
            TextEditingController?>(
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
    return BlocSelector<RegisterFormBloc, RegisterFormState,
            TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
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
  Widget _buildPassword1(BuildContext context) {
    return BlocSelector<RegisterFormBloc, RegisterFormState,
            TextEditingController?>(
        selector: (state) => state.passwordController1,
        builder: (context, passwordController1) {
          return CustomTextFormField(
              controller: passwordController1,
              hintText: "lbl_password_again".tr,
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
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
