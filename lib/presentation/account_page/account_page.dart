import 'bloc/account_bloc.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_title.dart';
import 'package:shopme/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountBloc>(
        create: (context) =>
            AccountBloc(AccountState(accountModelObj: AccountModel()))
              ..add(AccountInitialEvent()),
        child: AccountPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildOrder(context,
                        userImage: ImageConstant.imgUser,
                        orderLabel: "lbl_profile".tr, onTapBagIcon: () {
                      onTapUser(context);
                    }),
                    _buildOrder(context,
                        userImage: ImageConstant.imgBagIcon,
                        orderLabel: "lbl_order".tr, onTapOrder: () {
                      onTapTxtOrder(context);
                    }),
                    _buildOrder(context,
                        userImage: ImageConstant.imgLocationIcon,
                        orderLabel: "lbl_address".tr, onTapOrder: () {
                      onTapTxtAddress(context);
                    }),
                    SizedBox(height: 5.v),
                    _buildOrder(context,
                        userImage: ImageConstant.imgCreditCardIcon,
                        orderLabel: "lbl_payment".tr, onTapOrder: () {
                      onTapTxtPayment(context);
                    })
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_account".tr,
            margin: EdgeInsets.only(left: 16.h),
            onTap: () {
              onTapAccount(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIconBlueGray300,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Common widget
  Widget _buildOrder(
    BuildContext context, {
    required String userImage,
    required String orderLabel,
    Function? onTapBagIcon,
    Function? onTapOrder,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillBlue,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: userImage,
              height: 24.adaptSize,
              width: 24.adaptSize,
              onTap: () {
                onTapBagIcon!.call();
              }),
          GestureDetector(onTap: () {
            onTapOrder!.call();
          }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(orderLabel,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates to the addressScreen when the action is triggered.
  onTapAccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addressScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the orderScreen when the action is triggered.
  onTapTxtOrder(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.orderScreen,
    );
  }

  /// Navigates to the addressScreen when the action is triggered.
  onTapTxtAddress(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addressScreen,
    );
  }

  /// Navigates to the paymentMethodScreen when the action is triggered.
  onTapTxtPayment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}
