import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/orderdetails_item_model.dart';
import 'package:shopme/presentation/order_details_screen/models/order_details_model.dart';
part 'order_details_event.dart';
part 'order_details_state.dart';

/// A bloc that manages the state of a OrderDetails according to the event that is dispatched to it.
class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc(OrderDetailsState initialState) : super(initialState) {
    on<OrderDetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OrderDetailsInitialEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(state.copyWith(
        orderDetailsModelObj: state.orderDetailsModelObj
            ?.copyWith(orderdetailsItemList: fillOrderdetailsItemList())));
  }

  List<OrderdetailsItemModel> fillOrderdetailsItemList() {
    return [
      OrderdetailsItemModel(
          nikeAirfaintglu: ImageConstant.imgProductImage72x72,
          nikeAirZoomPegasus: "Nike Air faint glu",
          nikeAirfaintglu1: ImageConstant.imgLoveIconPink300,
          price: "299.43",
          one: "1"),
      OrderdetailsItemModel(
          nikeAirfaintglu: ImageConstant.imgProductImage7,
          price: "299.43",
          one: "1")
    ];
  }
}
