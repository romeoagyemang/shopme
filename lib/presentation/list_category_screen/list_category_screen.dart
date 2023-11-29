import 'bloc/list_category_bloc.dart';
import 'models/list_category_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ListCategoryBloc>(
        create: (context) => ListCategoryBloc(
            ListCategoryState(listCategoryModelObj: ListCategoryModel()))
          ..add(ListCategoryInitialEvent()),
        child: ListCategoryScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ListCategoryBloc, ListCategoryState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 70.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 156.v),
                                child: Column(children: [
                                  CustomElevatedButton(
                                      height: 26.v,
                                      width: 117.h,
                                      text: "lbl_category".tr,
                                      margin: EdgeInsets.only(left: 16.h),
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 12.h),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgArrowLeft,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize)),
                                      buttonStyle: CustomButtonStyles.none,
                                      buttonTextStyle:
                                          theme.textTheme.titleMedium!,
                                      onPressed: () {
                                        onTapCategory(context);
                                      },
                                      alignment: Alignment.centerLeft),
                                  SizedBox(height: 25.v),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgArrowLeftPrimary,
                                      userLabel: "lbl_shirt".tr,
                                      onTapBikiniIcon: () {
                                    onTapArrowLeft(context);
                                  }),
                                  _buildBikini(context,
                                      userImage: ImageConstant.imgBikiniIcon,
                                      userLabel: "lbl_bikini".tr,
                                      onTapBikini: () {
                                    onTapTxtBikini(context);
                                  }),
                                  _buildBikini(context,
                                      userImage: ImageConstant.imgClosePrimary,
                                      userLabel: "lbl_dress".tr,
                                      onTapBikini: () {
                                    onTapTxtDress(context);
                                  }),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgManWorkEquipment,
                                      userLabel: "lbl_work_equipment".tr,
                                      onTapBikini: () {
                                    onTapTxtWorkEquipment(context);
                                  }),
                                  _buildBikini(context,
                                      userImage: ImageConstant.imgManPantsIcon,
                                      userLabel: "lbl_man_pants".tr,
                                      onTapBikini: () {
                                    onTapTxtManPants(context);
                                  }),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgManShoesmanIcon,
                                      userLabel: "lbl_man_shoes".tr,
                                      onTapBikini: () {
                                    onTapTxtManShoes(context);
                                  }),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgManUnderwearIcon,
                                      userLabel: "lbl_man_underwear".tr,
                                      onTapBikini: () {
                                    onTapTxtManUnderwear(context);
                                  }),
                                  _buildBikini(context,
                                      userImage: ImageConstant.imgHome,
                                      userLabel: "lbl_man_t_shirt".tr,
                                      onTapBikini: () {
                                    onTapTxtManTShirt(context);
                                  }),
                                  _buildBikini(context,
                                      userImage: ImageConstant.imgBag,
                                      userLabel: "lbl_woman_bag".tr,
                                      onTapBikini: () {
                                    onTapTxtWomanBag(context);
                                  }),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgWomanPantsIcon,
                                      userLabel: "lbl_woman_pants".tr,
                                      onTapBikini: () {
                                    onTapTxtWomanPants(context);
                                  }),
                                  _buildBikini(context,
                                      userImage:
                                          ImageConstant.imgWomanShoesIcon,
                                      userLabel: "lbl_high_heels".tr,
                                      onTapBikini: () {
                                    onTapTxtHighHeels(context);
                                  })
                                ]))))
                  ]))));
    });
  }

  /// Common widget
  Widget _buildBikini(
    BuildContext context, {
    required String userImage,
    required String userLabel,
    Function? onTapBikiniIcon,
    Function? onTapBikini,
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
                onTapBikiniIcon!.call();
              }),
          GestureDetector(onTap: () {
            onTapBikini!.call();
          }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(userLabel,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates to the orderDetailsScreen when the action is triggered.
  onTapCategory(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.orderDetailsScreen,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtBikini(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtDress(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtWorkEquipment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtManPants(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtManShoes(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtManUnderwear(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtManTShirt(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtWomanBag(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtWomanPants(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }

  /// Navigates to the searchResultOneScreen when the action is triggered.
  onTapTxtHighHeels(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultOneScreen,
    );
  }
}
