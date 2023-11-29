import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/searchresultone_item_model.dart';
import 'package:shopme/presentation/search_result_one_screen/models/search_result_one_model.dart';
part 'search_result_one_event.dart';
part 'search_result_one_state.dart';

/// A bloc that manages the state of a SearchResultOne according to the event that is dispatched to it.
class SearchResultOneBloc
    extends Bloc<SearchResultOneEvent, SearchResultOneState> {
  SearchResultOneBloc(SearchResultOneState initialState) : super(initialState) {
    on<SearchResultOneInitialEvent>(_onInitialize);
  }

  List<SearchresultoneItemModel> fillSearchresultoneItemList() {
    return [
      SearchresultoneItemModel(
          image: ImageConstant.imgImage151,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      SearchresultoneItemModel(
          image: ImageConstant.imgImage221,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      SearchresultoneItemModel(
          image: ImageConstant.imgProductImage6,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299.43",
          oldPrice: "534.33",
          offer: "24% Off"),
      SearchresultoneItemModel(
          image: ImageConstant.imgImage171,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299.43",
          oldPrice: "534.33",
          offer: "24% Off"),
      SearchresultoneItemModel(
          image: ImageConstant.imgImage51,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      SearchresultoneItemModel(
          image: ImageConstant.imgProductImage5,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "100",
          oldPrice: "GHC 150",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    SearchResultOneInitialEvent event,
    Emitter<SearchResultOneState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        searchResultOneModelObj: state.searchResultOneModelObj?.copyWith(
            searchresultoneItemList: fillSearchresultoneItemList())));
  }
}
