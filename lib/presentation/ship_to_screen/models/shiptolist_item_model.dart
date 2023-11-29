/// This class is used in the [shiptolist_item_widget] screen.
class ShiptolistItemModel {
  ShiptolistItemModel({
    this.priscekila,
    this.address,
    this.mobileNumber,
    this.edit,
    this.delete,
    this.id,
  }) {
    priscekila = priscekila ?? "Prince Okoh";
    address = address ??
        "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 Accra Ghana";
    mobileNumber = mobileNumber ?? "+233 3456786";
    edit = edit ?? "Edit";
    delete = delete ?? "Delete";
    id = id ?? "";
  }

  String? priscekila;

  String? address;

  String? mobileNumber;

  String? edit;

  String? delete;

  String? id;
}
