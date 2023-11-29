import '../../../core/app_export.dart';

/// This class is used in the [dashboard_item_widget] screen.
class DashboardItemModel {
  DashboardItemModel({
    this.image,
    this.nikeAirMaxReact,
    this.price,
    this.oldPrice,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImageProduct;
    nikeAirMaxReact = nikeAirMaxReact ?? "Nike Air Max 270 React ENG";
    price = price ?? "140";
    oldPrice = oldPrice ?? " 180";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? nikeAirMaxReact;

  String? price;

  String? oldPrice;

  String? offer;

  String? id;
}
