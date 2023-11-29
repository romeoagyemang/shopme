import '../../../core/app_export.dart';

/// This class is used in the [megasalelist_item_widget] screen.
class MegasalelistItemModel {
  MegasalelistItemModel({
    this.image,
    this.mSNikeAirMax,
    this.price,
    this.oldPrice,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgProductImage1;
    mSNikeAirMax = mSNikeAirMax ?? "MS - Nike Air Max 270 React...";
    price = price ?? " 120";
    oldPrice = oldPrice ?? " 199";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? mSNikeAirMax;

  String? price;

  String? oldPrice;

  String? offer;

  String? id;
}
