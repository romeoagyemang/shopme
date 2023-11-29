// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'offerscreenone_item_model.dart';

/// This class defines the variables used in the [offer_screen_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OfferScreenOneModel extends Equatable {
  OfferScreenOneModel({this.offerscreenoneItemList = const []}) {}

  List<OfferscreenoneItemModel> offerscreenoneItemList;

  OfferScreenOneModel copyWith(
      {List<OfferscreenoneItemModel>? offerscreenoneItemList}) {
    return OfferScreenOneModel(
      offerscreenoneItemList:
          offerscreenoneItemList ?? this.offerscreenoneItemList,
    );
  }

  @override
  List<Object?> get props => [offerscreenoneItemList];
}
