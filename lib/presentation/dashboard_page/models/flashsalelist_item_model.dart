import '../../../core/app_export.dart';

/// This class is used in the [flashsalelist_item_widget] screen.
class FlashsalelistItemModel {
  FlashsalelistItemModel({
    this.fSNikeAirMax,
    this.image,
    this.price,
    this.oldPrice,
    this.offer,
    this.id,
  }) {
    fSNikeAirMax = fSNikeAirMax ?? "FS - Nike Air Max 270 React...";
    image = image ?? ImageConstant.imgImage111;
    price = price ?? "299";
    oldPrice = oldPrice ?? " 350";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? fSNikeAirMax;

  String? image;

  String? price;

  String? oldPrice;

  String? offer;

  String? id;
}
