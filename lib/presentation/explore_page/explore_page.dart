import '../explore_page/widgets/manfashion_item_widget.dart';
import '../explore_page/widgets/womanfashion_item_widget.dart';
import 'bloc/explore_bloc.dart';
import 'models/explore_model.dart';
import 'models/manfashion_item_model.dart';
import 'models/womanfashion_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_title_searchview.dart';
import 'package:shopme/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ExploreBloc>(
        create: (context) =>
            ExploreBloc(ExploreState(exploreModelObj: ExploreModel()))
              ..add(ExploreInitialEvent()),
        child: ExplorePage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_man_fashion".tr,
                              style: theme.textTheme.titleSmall),
                          SizedBox(height: 13.v),
                          _buildManFashion(context),
                          SizedBox(height: 22.v),
                          Text("lbl_woman_fashion".tr,
                              style: theme.textTheme.titleSmall),
                          SizedBox(height: 13.v),
                          _buildWomanFashion(context)
                        ]),
                  )),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: BlocSelector<ExploreBloc, ExploreState, TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return AppbarTitleSearchview(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_search_product".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h)),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIconBlueGray300,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center),
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIndicatore,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v),
                    onTap: () {
                      onTapImgImage(context);
                    })
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildManFashion(BuildContext context) {
    return BlocSelector<ExploreBloc, ExploreState, ExploreModel?>(
        selector: (state) => state.exploreModelObj,
        builder: (context, exploreModelObj) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 93.v,
                  crossAxisCount: 4,
                  mainAxisSpacing: 21.h,
                  crossAxisSpacing: 21.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount: exploreModelObj?.manfashionItemList.length ?? 0,
              itemBuilder: (context, index) {
                ManfashionItemModel model =
                    exploreModelObj?.manfashionItemList[index] ??
                        ManfashionItemModel();
                return ManfashionItemWidget(model);
              });
        });
  }

  /// Section Widget
  Widget _buildWomanFashion(BuildContext context) {
    return BlocSelector<ExploreBloc, ExploreState, ExploreModel?>(
        selector: (state) => state.exploreModelObj,
        builder: (context, exploreModelObj) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 94.v,
                  crossAxisCount: 4,
                  mainAxisSpacing: 21.h,
                  crossAxisSpacing: 21.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount: exploreModelObj?.womanfashionItemList.length ?? 0,
              itemBuilder: (context, index) {
                WomanfashionItemModel model =
                    exploreModelObj?.womanfashionItemList[index] ??
                        WomanfashionItemModel();
                return WomanfashionItemWidget(model);
              });
        });
  }

  /// Navigates to the notificationFeedScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationFeedScreen,
    );
  }
}
