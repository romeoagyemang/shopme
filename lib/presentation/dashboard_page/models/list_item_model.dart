import '../../../core/app_export.dart';

/// This class is used in the [list_item_widget] screen.
class ListItemModel {
  ListItemModel({
    this.arrowLeft,
    this.manShirt,
    this.id,
  }) {
    arrowLeft = arrowLeft ?? ImageConstant.imgArrowLeftPrimary;
    manShirt = manShirt ?? "Man Shirt";
    id = id ?? "";
  }

  String? arrowLeft;

  String? manShirt;

  String? id;
}
