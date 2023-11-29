import 'bloc/success_bloc.dart';
import 'models/success_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_icon_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SuccessBloc>(
      create: (context) => SuccessBloc(SuccessState(
        successModelObj: SuccessModel(),
      ))
        ..add(SuccessInitialEvent()),
      child: SuccessScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<SuccessBloc, SuccessState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    height: 72.adaptSize,
                    width: 72.adaptSize,
                    padding: EdgeInsets.all(18.h),
                    decoration: IconButtonStyleHelper.outlinePrimary,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    "lbl_success".tr,
                    style: CustomTextStyles.headlineSmallOnPrimary,
                  ),
                  SizedBox(height: 11.v),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "msg_thank_you_for_shopping".tr,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                    text: "lbl_back_to_order".tr,
                  ),
                  SizedBox(height: 1.v),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
