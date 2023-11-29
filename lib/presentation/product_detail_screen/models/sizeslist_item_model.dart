/// This class is used in the [sizeslist_item_widget] screen.
class SizeslistItemModel {
  SizeslistItemModel({
    this.six,
    this.id,
  }) {
    six = six ?? "6";
    id = id ?? "";
  }

  String? six;

  String? id;
}
