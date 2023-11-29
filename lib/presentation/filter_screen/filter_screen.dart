import '../filter_screen/widgets/buyingformatchipview_item_widget.dart';
import '../filter_screen/widgets/conditionchipview_item_widget.dart';
import '../filter_screen/widgets/itemlocationchipview_item_widget.dart';
import '../filter_screen/widgets/showonlychipview_item_widget.dart';
import 'bloc/filter_bloc.dart';
import 'models/buyingformatchipview_item_model.dart';
import 'models/conditionchipview_item_model.dart';
import 'models/filter_model.dart';
import 'models/itemlocationchipview_item_model.dart';
import 'models/showonlychipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';
import 'package:shopme/widgets/app_bar/appbar_leading_image.dart';
import 'package:shopme/widgets/app_bar/appbar_subtitle.dart';
import 'package:shopme/widgets/app_bar/custom_app_bar.dart';
import 'package:shopme/widgets/custom_elevated_button.dart';
import 'package:shopme/widgets/custom_text_form_field.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(FilterState(
        filterModelObj: FilterModel(),
      ))
        ..add(FilterInitialEvent()),
      child: FilterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 50.v),
          child: Column(
            children: [
              SizedBox(height: 31.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      right: 16.h,
                      bottom: 5.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_price_range".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 11.v),
                        _buildPriceRow(context),
                        SizedBox(height: 34.v),
                        Text(
                          "lbl_condition".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 13.v),
                        _buildConditionChipView(context),
                        SizedBox(height: 24.v),
                        Text(
                          "lbl_buying_format".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 11.v),
                        _buildBuyingFormatChipView(context),
                        SizedBox(height: 22.v),
                        Text(
                          "lbl_item_location".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 13.v),
                        _buildItemLocationChipView(context),
                        SizedBox(height: 25.v),
                        Text(
                          "lbl_show_only".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        SizedBox(height: 14.v),
                        _buildShowOnlyChipView(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildApplyButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 42.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgCloseIcon,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 16.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_filter_search".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildPriceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 6.h),
            child:
                BlocSelector<FilterBloc, FilterState, TextEditingController?>(
              selector: (state) => state.priceController,
              builder: (context, priceController) {
                return CustomTextFormField(
                  controller: priceController,
                  hintText: "lbl_1_245".tr,
                  hintStyle: CustomTextStyles.labelLargeBluegray300,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 6.h),
            child:
                BlocSelector<FilterBloc, FilterState, TextEditingController?>(
              selector: (state) => state.priceController1,
              builder: (context, priceController1) {
                return CustomTextFormField(
                  controller: priceController1,
                  hintText: "lbl_9_344".tr,
                  hintStyle: CustomTextStyles.labelLargeBluegray300,
                  textInputAction: TextInputAction.done,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildConditionChipView(BuildContext context) {
    return BlocSelector<FilterBloc, FilterState, FilterModel?>(
      selector: (state) => state.filterModelObj,
      builder: (context, filterModelObj) {
        return Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(
            filterModelObj?.conditionchipviewItemList.length ?? 0,
            (index) {
              ConditionchipviewItemModel model =
                  filterModelObj?.conditionchipviewItemList[index] ??
                      ConditionchipviewItemModel();

              return ConditionchipviewItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<FilterBloc>().add(
                      UpdateChipViewEvent(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBuyingFormatChipView(BuildContext context) {
    return BlocSelector<FilterBloc, FilterState, FilterModel?>(
      selector: (state) => state.filterModelObj,
      builder: (context, filterModelObj) {
        return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
            filterModelObj?.buyingformatchipviewItemList.length ?? 0,
            (index) {
              BuyingformatchipviewItemModel model =
                  filterModelObj?.buyingformatchipviewItemList[index] ??
                      BuyingformatchipviewItemModel();

              return BuyingformatchipviewItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<FilterBloc>().add(
                      UpdateChipView1Event(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildItemLocationChipView(BuildContext context) {
    return BlocSelector<FilterBloc, FilterState, FilterModel?>(
      selector: (state) => state.filterModelObj,
      builder: (context, filterModelObj) {
        return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
            filterModelObj?.itemlocationchipviewItemList.length ?? 0,
            (index) {
              ItemlocationchipviewItemModel model =
                  filterModelObj?.itemlocationchipviewItemList[index] ??
                      ItemlocationchipviewItemModel();

              return ItemlocationchipviewItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<FilterBloc>().add(
                      UpdateChipView2Event(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildShowOnlyChipView(BuildContext context) {
    return BlocSelector<FilterBloc, FilterState, FilterModel?>(
      selector: (state) => state.filterModelObj,
      builder: (context, filterModelObj) {
        return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
            filterModelObj?.showonlychipviewItemList.length ?? 0,
            (index) {
              ShowonlychipviewItemModel model =
                  filterModelObj?.showonlychipviewItemList[index] ??
                      ShowonlychipviewItemModel();

              return ShowonlychipviewItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<FilterBloc>().add(
                      UpdateChipView3Event(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildApplyButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_apply".tr,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
        bottom: 50.v,
      ),
    );
  }
}
