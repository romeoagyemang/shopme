import '../../../core/app_export.dart';

/// This class is used in the [womanfashion_item_widget] screen.
class WomanfashionItemModel {
  WomanfashionItemModel({
    this.dressIcon,
    this.dress,
    this.id,
  }) {
    dressIcon = dressIcon ?? ImageConstant.imgDressIcon;
    dress = dress ?? "Dress";
    id = id ?? "";
  }

  String? dressIcon;

  String? dress;

  String? id;
}
