import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary.withOpacity(1),
              body: SizedBox(
                  width: double.maxFinite,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLogo72x72,
                      height: 72.adaptSize,
                      width: 72.adaptSize,
                      alignment: Alignment.center,
                      onTap: () {
                        onTapImgLogo(context);
                      }))));
    });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapImgLogo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
