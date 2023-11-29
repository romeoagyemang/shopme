import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/manfashion_item_model.dart';
import '../models/womanfashion_item_model.dart';
import 'package:shopme/presentation/explore_page/models/explore_model.dart';
part 'explore_event.dart';
part 'explore_state.dart';

/// A bloc that manages the state of a Explore according to the event that is dispatched to it.
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(ExploreState initialState) : super(initialState) {
    on<ExploreInitialEvent>(_onInitialize);
  }

  List<ManfashionItemModel> fillManfashionItemList() {
    return [
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgArrowLeftPrimary, manShirt: "Man Shirt"),
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgManWorkEquipment,
          manShirt: "Man Work Equipment"),
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgManTShirtIcon, manShirt: "Man T-Shirt"),
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgManShoesIcon, manShirt: "Man Shoes"),
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgManPantsIconPrimary,
          manShirt: "Man Pants"),
      ManfashionItemModel(
          arrowLeft: ImageConstant.imgManUnderwearIconPrimary,
          manShirt: "Man Underwear")
    ];
  }

  List<WomanfashionItemModel> fillWomanfashionItemList() {
    return [
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgDressIcon, dress: "Dress"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgWomanTShirtIcon, dress: "Woman T-Shirt"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgWomanPantsIconPrimary,
          dress: "Woman Pants"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgSkirtIcon, dress: "Skirt"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgWomanBagIcon, dress: "Woman Bag"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgHighHeelsIcon, dress: "High Heels"),
      WomanfashionItemModel(
          dressIcon: ImageConstant.imgBikiniIcon, dress: "Bikini")
    ];
  }

  _onInitialize(
    ExploreInitialEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        exploreModelObj: state.exploreModelObj?.copyWith(
            manfashionItemList: fillManfashionItemList(),
            womanfashionItemList: fillWomanfashionItemList())));
  }
}
