import '../../../core/app_export.dart';

/// This class is used in the [offerscreenone_item_widget] screen.
class OfferscreenoneItemModel {
  OfferscreenoneItemModel({
    this.image,
    this.nikeAirMaxReact,
    this.price,
    this.price1,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgProductIcon;
    nikeAirMaxReact = nikeAirMaxReact ?? "Nike Air Max 270 React ENG";
    price = price ?? "150";
    price1 = price1 ?? "GHC 170";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? nikeAirMaxReact;

  String? price;

  String? price1;

  String? offer;

  String? id;
}
