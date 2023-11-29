import '../../../core/app_export.dart';

/// This class is used in the [orderdetails_item_widget] screen.
class OrderdetailsItemModel {
  OrderdetailsItemModel({
    this.nikeAirfaintglu,
    this.nikeAirZoomPegasus,
    this.nikeAirfaintglu1,
    this.price,
    this.one,
    this.id,
  }) {
    nikeAirfaintglu = nikeAirfaintglu ?? ImageConstant.imgProductImage72x72;
    nikeAirZoomPegasus = nikeAirZoomPegasus ?? "Nike Air faint glu";
    nikeAirfaintglu1 = nikeAirfaintglu1 ?? ImageConstant.imgLoveIconPink300;
    price = price ?? "299.43";
    one = one ?? "1";
    id = id ?? "";
  }

  String? nikeAirfaintglu;

  String? nikeAirZoomPegasus;

  String? nikeAirfaintglu1;

  String? price;

  String? one;

  String? id;
}
