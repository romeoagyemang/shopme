// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'manfashion_item_model.dart';
import 'womanfashion_item_model.dart';

/// This class defines the variables used in the [explore_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ExploreModel extends Equatable {
  ExploreModel({
    this.manfashionItemList = const [],
    this.womanfashionItemList = const [],
  }) {}

  List<ManfashionItemModel> manfashionItemList;

  List<WomanfashionItemModel> womanfashionItemList;

  ExploreModel copyWith({
    List<ManfashionItemModel>? manfashionItemList,
    List<WomanfashionItemModel>? womanfashionItemList,
  }) {
    return ExploreModel(
      manfashionItemList: manfashionItemList ?? this.manfashionItemList,
      womanfashionItemList: womanfashionItemList ?? this.womanfashionItemList,
    );
  }

  @override
  List<Object?> get props => [manfashionItemList, womanfashionItemList];
}
