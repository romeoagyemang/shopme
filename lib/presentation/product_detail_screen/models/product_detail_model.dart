// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'productslider_item_model.dart';
import 'sizeslist_item_model.dart';
import 'products_item_model.dart';
import 'recommendedlist_item_model.dart';

/// This class defines the variables used in the [product_detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDetailModel extends Equatable {
  ProductDetailModel({
    this.productsliderItemList = const [],
    this.sizeslistItemList = const [],
    this.productsItemList = const [],
    this.recommendedlistItemList = const [],
  }) {}

  List<ProductsliderItemModel> productsliderItemList;

  List<SizeslistItemModel> sizeslistItemList;

  List<ProductsItemModel> productsItemList;

  List<RecommendedlistItemModel> recommendedlistItemList;

  ProductDetailModel copyWith({
    List<ProductsliderItemModel>? productsliderItemList,
    List<SizeslistItemModel>? sizeslistItemList,
    List<ProductsItemModel>? productsItemList,
    List<RecommendedlistItemModel>? recommendedlistItemList,
  }) {
    return ProductDetailModel(
      productsliderItemList:
          productsliderItemList ?? this.productsliderItemList,
      sizeslistItemList: sizeslistItemList ?? this.sizeslistItemList,
      productsItemList: productsItemList ?? this.productsItemList,
      recommendedlistItemList:
          recommendedlistItemList ?? this.recommendedlistItemList,
    );
  }

  @override
  List<Object?> get props => [
        productsliderItemList,
        sizeslistItemList,
        productsItemList,
        recommendedlistItemList
      ];
}
