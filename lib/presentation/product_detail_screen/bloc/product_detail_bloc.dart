import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productslider_item_model.dart';
import '../models/sizeslist_item_model.dart';
import '../models/products_item_model.dart';
import '../models/recommendedlist_item_model.dart';
import 'package:shopme/presentation/product_detail_screen/models/product_detail_model.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

/// A bloc that manages the state of a ProductDetail according to the event that is dispatched to it.
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(ProductDetailState initialState) : super(initialState) {
    on<ProductDetailInitialEvent>(_onInitialize);
  }

  List<ProductsliderItemModel> fillProductsliderItemList() {
    return List.generate(1, (index) => ProductsliderItemModel());
  }

  List<SizeslistItemModel> fillSizeslistItemList() {
    return [
      SizeslistItemModel(six: "6"),
      SizeslistItemModel(six: "6.5"),
      SizeslistItemModel(six: "7"),
      SizeslistItemModel(six: "7.5"),
      SizeslistItemModel(six: "8"),
      SizeslistItemModel(six: "8.5")
    ];
  }

  List<ProductsItemModel> fillProductsItemList() {
    return [
      ProductsItemModel(productPicture: ImageConstant.imgProductPicture02),
      ProductsItemModel(productPicture: ImageConstant.imgProductPicture03),
      ProductsItemModel(productPicture: ImageConstant.imgProductPicture01)
    ];
  }

  List<RecommendedlistItemModel> fillRecommendedlistItemList() {
    return [
      RecommendedlistItemModel(
          image: ImageConstant.imgProductImage10,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      RecommendedlistItemModel(
          image: ImageConstant.imgProductImage,
          fSNikeAirMax: "FS - QUILTED MAXI CROS...",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off"),
      RecommendedlistItemModel(
          image: ImageConstant.imgProductImage109x109,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          oldPrice: "534,33",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    ProductDetailInitialEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        productDetailModelObj: state.productDetailModelObj?.copyWith(
            productsliderItemList: fillProductsliderItemList(),
            sizeslistItemList: fillSizeslistItemList(),
            productsItemList: fillProductsItemList(),
            recommendedlistItemList: fillRecommendedlistItemList())));
  }
}
