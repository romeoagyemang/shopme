import '../search_result_one_screen/widgets/searchresultone_item_widget.dart';
import 'bloc/search_result_one_bloc.dart';
import 'models/search_result_one_model.dart';
import 'models/searchresultone_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_title_edittext.dart';
import 'package:shopme/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';

class SearchResultOneScreen extends StatelessWidget {
  const SearchResultOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchResultOneBloc>(
        create: (context) => SearchResultOneBloc(SearchResultOneState(
            searchResultOneModelObj: SearchResultOneModel()))
          ..add(SearchResultOneInitialEvent()),
        child: SearchResultOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  Divider(),
                  SizedBox(height: 15.v),
                  _buildResultCounter(context),
                  SizedBox(height: 14.v),
                  _buildSearchResultOne(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: BlocSelector<SearchResultOneBloc, SearchResultOneState,
                TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return AppbarTitleEdittext(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_nike_air_max".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSort,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapSort(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFilter,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              onTap: () {
                onTapFilter(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildResultCounter(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                  opacity: 0.5,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Text("lbl_145_result".tr,
                          style: CustomTextStyles.labelLargeOnPrimary))),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                  child: Text("lbl_man_shoes".tr,
                      style: theme.textTheme.labelLarge)),
              CustomImageView(
                  imagePath: ImageConstant.imgDownIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 8.h))
            ]));
  }

  /// Section Widget
  Widget _buildSearchResultOne(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: BlocSelector<SearchResultOneBloc, SearchResultOneState,
                    SearchResultOneModel?>(
                selector: (state) => state.searchResultOneModelObj,
                builder: (context, searchResultOneModelObj) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 283.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 13.h,
                          crossAxisSpacing: 13.h),
                      physics: BouncingScrollPhysics(),
                      itemCount: searchResultOneModelObj
                              ?.searchresultoneItemList.length ??
                          0,
                      itemBuilder: (context, index) {
                        SearchresultoneItemModel model = searchResultOneModelObj
                                ?.searchresultoneItemList[index] ??
                            SearchresultoneItemModel();
                        return SearchresultoneItemWidget(model);
                      });
                })));
  }

  /// Navigates to the sortByScreen when the action is triggered.
  onTapSort(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sortByScreen,
    );
  }

  /// Navigates to the filterScreen when the action is triggered.
  onTapFilter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.filterScreen,
    );
  }
}
