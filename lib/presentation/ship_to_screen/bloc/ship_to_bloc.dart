import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/shiptolist_item_model.dart';
import 'package:shopme/presentation/ship_to_screen/models/ship_to_model.dart';
part 'ship_to_event.dart';
part 'ship_to_state.dart';

/// A bloc that manages the state of a ShipTo according to the event that is dispatched to it.
class ShipToBloc extends Bloc<ShipToEvent, ShipToState> {
  ShipToBloc(ShipToState initialState) : super(initialState) {
    on<ShipToInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ShipToInitialEvent event,
    Emitter<ShipToState> emit,
  ) async {
    emit(state.copyWith(
        shipToModelObj: state.shipToModelObj
            ?.copyWith(shiptolistItemList: fillShiptolistItemList())));
  }

  List<ShiptolistItemModel> fillShiptolistItemList() {
    return [
      ShiptolistItemModel(
          priscekila: "Prince Okoh",
          address:
              "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 Accra Ghana",
          mobileNumber: "+233 3456786",
          edit: "Edit",
          delete: "Delete"),
      ShiptolistItemModel(
          priscekila: "David  ",
          address:
              "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 Accra Ghana",
          mobileNumber: "+233 3456786",
          edit: "Edit",
          delete: "Delete"),
      ShiptolistItemModel(
          priscekila: "Enoch Haruna",
          address:
              "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 Accra Ghana",
          mobileNumber: "+233 3456786",
          edit: "Edit",
          delete: "Delete")
    ];
  }
}
