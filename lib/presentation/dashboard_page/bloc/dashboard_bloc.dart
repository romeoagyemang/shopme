import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/slider_item_model.dart';
import '../models/list_item_model.dart';
import '../models/flashsalelist_item_model.dart';
import '../models/megasalelist_item_model.dart';
import '../models/dashboard_item_model.dart';
import 'package:shopme/presentation/dashboard_page/models/dashboard_model.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<DashboardInitialEvent>(_onInitialize);
  }

  List<SliderItemModel> fillSliderItemList() {
    return List.generate(1, (index) => SliderItemModel());
  }

  List<ListItemModel> fillListItemList() {
    return [
      ListItemModel(
          arrowLeft: ImageConstant.imgArrowLeftPrimary, manShirt: "Man Shirt"),
      ListItemModel(arrowLeft: ImageConstant.imgDressIcon, manShirt: "Dress"),
      ListItemModel(
          arrowLeft: ImageConstant.imgManWorkEquipment,
          manShirt: "Man Work Equipment"),
      ListItemModel(
          arrowLeft: ImageConstant.imgWomanBagIcon, manShirt: "Woman Bag"),
      ListItemModel(
          arrowLeft: ImageConstant.imgManShoesIcon, manShirt: "Man Shoes"),
      ListItemModel(
          arrowLeft: ImageConstant.imgHighHeelsIcon, manShirt: "High Heels")
    ];
  }

  List<FlashsalelistItemModel> fillFlashsalelistItemList() {
    return [
      FlashsalelistItemModel(
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          image: ImageConstant.imgImage111,
          price: "299",
          oldPrice: " 350",
          offer: "24% Off")
    ];
  }

  List<MegasalelistItemModel> fillMegasalelistItemList() {
    return [
      MegasalelistItemModel(
          image: ImageConstant.imgProductImage1,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: " 120",
          oldPrice: " 199",
          offer: "24% Off"),
      MegasalelistItemModel(
          image: ImageConstant.imgProductImage2,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: " 99",
          oldPrice: " 170",
          offer: "24% Off"),
      MegasalelistItemModel(
          image: ImageConstant.imgProductImage3,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: "GHC 180",
          oldPrice: "GHC 145",
          offer: "24% Off")
    ];
  }

  List<DashboardItemModel> fillDashboardItemList() {
    return [
      DashboardItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "140",
          oldPrice: " 180",
          offer: "24% Off"),
      DashboardItemModel(
          image: ImageConstant.imgProductImage133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "  150",
          oldPrice: " 199",
          offer: "24% Off"),
      DashboardItemModel(
          image: ImageConstant.imgProductImage4,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: " 100",
          oldPrice: "170",
          offer: "24% Off"),
      DashboardItemModel(
          image: ImageConstant.imgProductImage5,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "200",
          oldPrice: " 350",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        dashboardModelObj: state.dashboardModelObj?.copyWith(
            sliderItemList: fillSliderItemList(),
            listItemList: fillListItemList(),
            flashsalelistItemList: fillFlashsalelistItemList(),
            megasalelistItemList: fillMegasalelistItemList(),
            dashboardItemList: fillDashboardItemList())));
  }
}
