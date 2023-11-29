/// This class is used in the [addresslist_item_widget] screen.
class AddresslistItemModel {
  AddresslistItemModel({
    this.priscekila,
    this.address,
    this.mobileNumber,
    this.edit,
    this.delete,
    this.id,
  }) {
    priscekila = priscekila ?? "Andy Collins ";
    address = address ?? "Accra Mccarthy Hill Ghana\nStreet number 123466";
    mobileNumber = mobileNumber ?? "+233 025654374";
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
