import '../../../core/app_export.dart';

/// This class is used in the [notificationfeed_item_widget] screen.
class NotificationfeedItemModel {
  NotificationfeedItemModel({
    this.newProduct,
    this.newProduct1,
    this.nikeAirZoomPegasus,
    this.time,
    this.id,
  }) {
    newProduct = newProduct ?? ImageConstant.imgProductImage48x48;
    newProduct1 = newProduct1 ?? "New Product";
    nikeAirZoomPegasus = nikeAirZoomPegasus ??
        "Nike Air Zoom Pegasus 36 Miami - Special For your Activity";
    time = time ?? "october 3, 2023 5:06 PM";
    id = id ?? "";
  }

  String? newProduct;

  String? newProduct1;

  String? nikeAirZoomPegasus;

  String? time;

  String? id;
}
