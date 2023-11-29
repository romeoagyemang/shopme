import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/offerscreenone_item_model.dart';
import 'package:shopme/presentation/offer_screen_one_screen/models/offer_screen_one_model.dart';
part 'offer_screen_one_event.dart';
part 'offer_screen_one_state.dart';

/// A bloc that manages the state of a OfferScreenOne according to the event that is dispatched to it.
class OfferScreenOneBloc
    extends Bloc<OfferScreenOneEvent, OfferScreenOneState> {
  OfferScreenOneBloc(OfferScreenOneState initialState) : super(initialState) {
    on<OfferScreenOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OfferScreenOneInitialEvent event,
    Emitter<OfferScreenOneState> emit,
  ) async {
    emit(state.copyWith(
        offerScreenOneModelObj: state.offerScreenOneModelObj
            ?.copyWith(offerscreenoneItemList: fillOfferscreenoneItemList())));
  }

  List<OfferscreenoneItemModel> fillOfferscreenoneItemList() {
    return [
      OfferscreenoneItemModel(
          image: ImageConstant.imgProductIcon,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "150",
          price1: "GHC 170",
          offer: "24% Off"),
      OfferscreenoneItemModel(
          image: ImageConstant.imgProductImage133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: " 100",
          price1: "GHC 130",
          offer: "24% Off"),
      OfferscreenoneItemModel(
          image: ImageConstant.imgProductImage4,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: " 130",
          price1: "GHC170",
          offer: "24% Off"),
      OfferscreenoneItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "100",
          price1: "GHC 200",
          offer: "24% Off")
    ];
  }
}
