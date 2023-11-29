import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/favoriteproduct_item_model.dart';
import 'package:shopme/presentation/favorite_product_screen/models/favorite_product_model.dart';
part 'favorite_product_event.dart';
part 'favorite_product_state.dart';

/// A bloc that manages the state of a FavoriteProduct according to the event that is dispatched to it.
class FavoriteProductBloc
    extends Bloc<FavoriteProductEvent, FavoriteProductState> {
  FavoriteProductBloc(FavoriteProductState initialState) : super(initialState) {
    on<FavoriteProductInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FavoriteProductInitialEvent event,
    Emitter<FavoriteProductState> emit,
  ) async {
    emit(state.copyWith(
        favoriteProductModelObj: state.favoriteProductModelObj?.copyWith(
            favoriteproductItemList: fillFavoriteproductItemList())));
  }

  List<FavoriteproductItemModel> fillFavoriteproductItemList() {
    return [
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgProductIcon,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage6,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgImageProduct133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off")
    ];
  }
}
