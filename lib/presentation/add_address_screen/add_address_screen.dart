import 'bloc/add_address_bloc.dart';
import 'models/add_address_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/core/utils/validation_functions.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAddressBloc>(
        create: (context) => AddAddressBloc(
            AddAddressState(addAddressModelObj: AddAddressModel()))
          ..add(AddAddressInitialEvent()),
        child: AddAddressScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 50.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h, right: 16.h, bottom: 5.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("msg_country_or_region".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCountry(context),
                                        SizedBox(height: 21.v),
                                        Text("lbl_first_name".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 13.v),
                                        _buildFirstName(context),
                                        SizedBox(height: 23.v),
                                        Text("lbl_last_name".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildLastName(context),
                                        SizedBox(height: 23.v),
                                        Text("lbl_street_address".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildStreetAddress(context),
                                        SizedBox(height: 21.v),
                                        Text("msg_street_address_2".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 16.v),
                                        _buildStreetAddressTwo(context),
                                        SizedBox(height: 22.v),
                                        Text("lbl_city".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCity(context),
                                        SizedBox(height: 23.v),
                                        Text("msg_state_province_region".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildOldPassword(context),
                                        SizedBox(height: 24.v),
                                        Text("lbl_zip_code".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildZipCode(context),
                                        SizedBox(height: 23.v),
                                        Text("lbl_phone_number".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildPhoneNumber(context)
                                      ]))))
                    ]))),
            bottomNavigationBar: _buildAddAddressButton(context)));
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
            text: "lbl_add_address".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.countryController,
        builder: (context, countryController) {
          return CustomTextFormField(
              controller: countryController,
              hintText: "msg_enter_the_country".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.firstNameController,
        builder: (context, firstNameController) {
          return CustomTextFormField(
              controller: firstNameController,
              hintText: "msg_enter_the_first".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.lastNameController,
        builder: (context, lastNameController) {
          return CustomTextFormField(
              controller: lastNameController,
              hintText: "msg_enter_the_last_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 11.h, vertical: 15.v),
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildStreetAddress(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.streetAddressController,
        builder: (context, streetAddressController) {
          return CustomTextFormField(
              controller: streetAddressController,
              hintText: "msg_enter_the_street".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildStreetAddressTwo(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.streetAddressTwoController,
        builder: (context, streetAddressTwoController) {
          return CustomTextFormField(
              controller: streetAddressTwoController,
              hintText: "msg_enter_the_street2".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildCity(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.cityController,
        builder: (context, cityController) {
          return CustomTextFormField(
              controller: cityController,
              hintText: "lbl_enter_the_city".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildOldPassword(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.oldPasswordController,
        builder: (context, oldPasswordController) {
          return CustomTextFormField(
              controller: oldPasswordController,
              hintText: "msg_enter_the_state".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildZipCode(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.zipCodeController,
        builder: (context, zipCodeController) {
          return CustomTextFormField(
              controller: zipCodeController,
              hintText: "msg_enter_the_zip_code".tr,
              textInputType: TextInputType.number,
              validator: (value) {
                if (!isNumeric(value)) {
                  return "err_msg_please_enter_valid_number".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.phoneNumberController,
        builder: (context, phoneNumberController) {
          return CustomTextFormField(
              controller: phoneNumberController,
              hintText: "msg_enter_the_phone".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlue,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildAddAddressButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_address".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
