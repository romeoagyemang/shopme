import '../dashboard_page/widgets/dashboard_item_widget.dart';
import '../dashboard_page/widgets/flashsalelist_item_widget.dart';
import '../dashboard_page/widgets/list_item_widget.dart';
import '../dashboard_page/widgets/megasalelist_item_widget.dart';
import '../dashboard_page/widgets/slider_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/flashsalelist_item_model.dart';
import 'models/list_item_model.dart';
import 'models/megasalelist_item_model.dart';
import 'models/slider_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:shopme/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
        create: (context) =>
            DashboardBloc(DashboardState(dashboardModelObj: DashboardModel()))
              ..add(DashboardInitialEvent()),
        child: DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 19.v),
                  _buildSlider(context),
                  SizedBox(height: 14.v),
                  BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                    return SizedBox(
                        height: 8.v,
                        child: AnimatedSmoothIndicator(
                            activeIndex: state.sliderIndex,
                            count: state
                                    .dashboardModelObj?.sliderItemList.length ??
                                0,
                            axisDirection: Axis.horizontal,
                            effect: ScrollingDotsEffect(
                                spacing: 8,
                                activeDotColor:
                                    theme.colorScheme.primary.withOpacity(1),
                                dotColor: appTheme.blue50,
                                dotHeight: 8.v,
                                dotWidth: 8.h)));
                  }),
                  SizedBox(height: 25.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildFlashSaleHeader(context,
                          flashSaleText: "lbl_category".tr,
                          seeMoreText: "lbl_more_category".tr)),
                  SizedBox(height: 8.v),
                  _buildList(context),
                  SizedBox(height: 23.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildFlashSaleHeader(context,
                          flashSaleText: "lbl_flash_sale".tr,
                          seeMoreText: "lbl_see_more".tr)),
                  SizedBox(height: 12.v),
                  _buildFlashSaleList(context),
                  SizedBox(height: 23.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildFlashSaleHeader(context,
                          flashSaleText: "lbl_mega_sale".tr,
                          seeMoreText: "lbl_see_more".tr)),
                  SizedBox(height: 10.v),
                  _buildMegaSaleList(context),
                  SizedBox(height: 24.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgPromotionImage206x343,
                      height: 206.v,
                      width: 343.h,
                      radius: BorderRadius.circular(5.h)),
                  SizedBox(height: 24.v),
                  _buildDashboard(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgSearch,
            margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
        title: AppbarSubtitleOne(
            text: "lbl_search_product".tr, margin: EdgeInsets.only(left: 8.h)),
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
  Widget _buildSlider(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
          return CarouselSlider.builder(
              options: CarouselOptions(
                  height: 206.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    state.sliderIndex = index;
                  }),
              itemCount: state.dashboardModelObj?.sliderItemList.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                SliderItemModel model =
                    state.dashboardModelObj?.sliderItemList[index] ??
                        SliderItemModel();
                return SliderItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return SizedBox(
        height: 109.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 14.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10.h);
                  },
                  itemCount: dashboardModelObj?.listItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ListItemModel model =
                        dashboardModelObj?.listItemList[index] ??
                            ListItemModel();
                    return ListItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildFlashSaleList(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount:
                      dashboardModelObj?.flashsalelistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    FlashsalelistItemModel model =
                        dashboardModelObj?.flashsalelistItemList[index] ??
                            FlashsalelistItemModel();
                    return FlashsalelistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildMegaSaleList(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount:
                      dashboardModelObj?.megasalelistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    MegasalelistItemModel model =
                        dashboardModelObj?.megasalelistItemList[index] ??
                            MegasalelistItemModel();
                    return MegasalelistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildDashboard(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
                selector: (state) => state.dashboardModelObj,
                builder: (context, dashboardModelObj) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 283.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 13.h,
                          crossAxisSpacing: 13.h),
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          dashboardModelObj?.dashboardItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        DashboardItemModel model =
                            dashboardModelObj?.dashboardItemList[index] ??
                                DashboardItemModel();
                        return DashboardItemWidget(model);
                      });
                })));
  }

  /// Common widget
  Widget _buildFlashSaleHeader(
    BuildContext context, {
    required String flashSaleText,
    required String seeMoreText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(flashSaleText,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
      Text(seeMoreText,
          style: CustomTextStyles.titleSmallPrimary
              .copyWith(color: theme.colorScheme.primary.withOpacity(1)))
    ]);
  }

  /// Navigates to the notificationFeedScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationFeedScreen,
    );
  }
}
