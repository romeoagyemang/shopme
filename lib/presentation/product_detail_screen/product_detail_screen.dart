import '../product_detail_screen/widgets/products_item_widget.dart';
import '../product_detail_screen/widgets/productslider_item_widget.dart';
import '../product_detail_screen/widgets/recommendedlist_item_widget.dart';
import '../product_detail_screen/widgets/sizeslist_item_widget.dart';
import 'bloc/product_detail_bloc.dart';
import 'models/product_detail_model.dart';
import 'models/products_item_model.dart';
import 'models/productslider_item_model.dart';
import 'models/recommendedlist_item_model.dart';
import 'models/sizeslist_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
        create: (context) => ProductDetailBloc(
            ProductDetailState(productDetailModelObj: ProductDetailModel()))
          ..add(ProductDetailInitialEvent()),
        child: ProductDetailScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 50.v),
                child: Column(children: [
                  SizedBox(height: 12.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildProductSlider(context),
                                    SizedBox(height: 16.v),
                                    Align(
                                        alignment: Alignment.center,
                                        child: BlocBuilder<ProductDetailBloc,
                                                ProductDetailState>(
                                            builder: (context, state) {
                                          return SizedBox(
                                              height: 8.v,
                                              child: AnimatedSmoothIndicator(
                                                  activeIndex:
                                                      state.sliderIndex,
                                                  count: state
                                                          .productDetailModelObj
                                                          ?.productsliderItemList
                                                          .length ??
                                                      0,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  effect: ScrollingDotsEffect(
                                                      spacing: 8,
                                                      activeDotColor: theme
                                                          .colorScheme.primary
                                                          .withOpacity(1),
                                                      dotColor: appTheme.blue50,
                                                      dotHeight: 8.v,
                                                      dotWidth: 8.h)));
                                        })),
                                    SizedBox(height: 15.v),
                                    _buildProductNameRow(context),
                                    SizedBox(height: 8.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: CustomRatingBar(
                                            initialRating: 4, itemSize: 16)),
                                    SizedBox(height: 16.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text("lbl_299_43".tr,
                                            style: theme.textTheme.titleLarge)),
                                    SizedBox(height: 22.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text("lbl_select_size".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 13.v),
                                    _buildSizesList(context),
                                    SizedBox(height: 23.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text("lbl_select_color".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 12.v),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgColors,
                                        height: 48.v,
                                        width: 359.h,
                                        margin: EdgeInsets.only(left: 16.h)),
                                    SizedBox(height: 24.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text("lbl_specification".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h),
                                        child: _buildStyle(context,
                                            styleText: "lbl_shown".tr,
                                            styleCode:
                                                "msg_laser_blue_anth".tr)),
                                    SizedBox(height: 38.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h),
                                        child: _buildStyle(context,
                                            styleText: "lbl_style".tr,
                                            styleCode: "lbl_cd0113_400".tr)),
                                    SizedBox(height: 19.v),
                                    Container(
                                        width: 322.h,
                                        margin: EdgeInsets.only(
                                            left: 16.h, right: 36.h),
                                        child: Text("msg_the_nike_air_max".tr,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 20.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h),
                                        child: _buildStyle(context,
                                            styleText: "lbl_review_product".tr,
                                            styleCode: "lbl_see_more".tr)),
                                    SizedBox(height: 8.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Row(children: [
                                          CustomRatingBar(
                                              initialRating: 4, itemSize: 16),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.h),
                                              child: Text("lbl_4_5".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumBluegray300)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 3.h),
                                              child: Text("lbl_5_review2".tr,
                                                  style: CustomTextStyles
                                                      .bodySmall10))
                                        ])),
                                    SizedBox(height: 10.v),
                                    _buildJamesLawsonStack(context),
                                    SizedBox(height: 23.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: Text(
                                            "msg_you_might_also_like".tr,
                                            style:
                                                CustomTextStyles.titleSmall_1)),
                                    SizedBox(height: 11.v),
                                    _buildRecommendedList(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildAddToCartButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "msg_nike_air_max_2704".tr,
            margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNavExplore,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 15.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMoreIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 31.h))
        ]);
  }

  /// Section Widget
  Widget _buildProductSlider(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
      return CarouselSlider.builder(
          options: CarouselOptions(
              height: 238.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                state.sliderIndex = index;
              }),
          itemCount:
              state.productDetailModelObj?.productsliderItemList.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            ProductsliderItemModel model =
                state.productDetailModelObj?.productsliderItemList[index] ??
                    ProductsliderItemModel();
            return ProductsliderItemWidget(model);
          });
    });
  }

  /// Section Widget
  Widget _buildProductNameRow(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SizedBox(
                          width: 275.h,
                          child: Text("msg_nike_air_zoom_pegasus".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleLargeOnPrimary
                                  .copyWith(height: 1.50)))),
                  CustomImageView(
                      imagePath: ImageConstant.imgLoveIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin:
                          EdgeInsets.only(left: 44.h, top: 2.v, bottom: 33.v))
                ])));
  }

  /// Section Widget
  Widget _buildSizesList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 48.v,
            child: BlocSelector<ProductDetailBloc, ProductDetailState,
                    ProductDetailModel?>(
                selector: (state) => state.productDetailModelObj,
                builder: (context, productDetailModelObj) {
                  return ListView.separated(
                      padding: EdgeInsets.only(left: 16.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16.h);
                      },
                      itemCount:
                          productDetailModelObj?.sizeslistItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        SizeslistItemModel model =
                            productDetailModelObj?.sizeslistItemList[index] ??
                                SizeslistItemModel();
                        return SizeslistItemWidget(model);
                      });
                })));
  }

  /// Section Widget
  Widget _buildJamesLawsonStack(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 299.v,
            width: 339.h,
            child: Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 64.h),
                            child: Text("lbl_andy_collins2".tr,
                                style: theme.textTheme.titleSmall)),
                        SizedBox(height: 3.v),
                        Padding(
                            padding: EdgeInsets.only(left: 64.h),
                            child: CustomRatingBar(
                                initialRating: 4, itemSize: 16)),
                        SizedBox(height: 22.v),
                        SizedBox(
                            width: 339.h,
                            child: Text("msg_air_max_are_always".tr,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(height: 1.80))),
                        SizedBox(height: 13.v),
                        SizedBox(
                            height: 72.v,
                            child: BlocSelector<ProductDetailBloc,
                                    ProductDetailState, ProductDetailModel?>(
                                selector: (state) =>
                                    state.productDetailModelObj,
                                builder: (context, productDetailModelObj) {
                                  return ListView.separated(
                                      padding: EdgeInsets.only(right: 99.h),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(width: 12.h);
                                      },
                                      itemCount: productDetailModelObj
                                              ?.productsItemList.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        ProductsItemModel model =
                                            productDetailModelObj
                                                    ?.productsItemList[index] ??
                                                ProductsItemModel();
                                        return ProductsItemWidget(model);
                                      });
                                })),
                        SizedBox(height: 16.v),
                        Text("msg_december_10_2016".tr,
                            style: CustomTextStyles.bodySmall10)
                      ])),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      margin: EdgeInsets.only(left: 1.h),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(1),
                          borderRadius: BorderRadius.circular(22.h))))
            ])));
  }

  /// Section Widget
  Widget _buildRecommendedList(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: BlocSelector<ProductDetailBloc, ProductDetailState,
                ProductDetailModel?>(
            selector: (state) => state.productDetailModelObj,
            builder: (context, productDetailModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount:
                      productDetailModelObj?.recommendedlistItemList.length ??
                          0,
                  itemBuilder: (context, index) {
                    RecommendedlistItemModel model =
                        productDetailModelObj?.recommendedlistItemList[index] ??
                            RecommendedlistItemModel();
                    return RecommendedlistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildAddToCartButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_to_cart".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Common widget
  Widget _buildStyle(
    BuildContext context, {
    required String styleText,
    required String styleCode,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(styleText,
              style: CustomTextStyles.bodySmallOnPrimary_2.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1)))),
      Text(styleCode,
          style:
              theme.textTheme.bodySmall!.copyWith(color: appTheme.blueGray300))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
