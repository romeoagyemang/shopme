import '../../../core/app_export.dart';

/// This class is used in the [cartlist_item_widget] screen.
class CartlistItemModel {
  CartlistItemModel({
    this.nikeAirexecutive,
    this.nikeAirZoomPegasus,
    this.price,
    this.one,
    this.id,
  }) {
    nikeAirexecutive = nikeAirexecutive ?? ImageConstant.imgImage161;
    nikeAirZoomPegasus = nikeAirZoomPegasus ?? "Nike Air executive";
    price = price ?? " 320";
    one = one ?? "1";
    id = id ?? "";
  }

  String? nikeAirexecutive;

  String? nikeAirZoomPegasus;

  String? price;

  String? one;

  String? id;
}
