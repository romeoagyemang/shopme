// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'searchresultone_item_model.dart';

/// This class defines the variables used in the [search_result_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchResultOneModel extends Equatable {
  SearchResultOneModel({this.searchresultoneItemList = const []}) {}

  List<SearchresultoneItemModel> searchresultoneItemList;

  SearchResultOneModel copyWith(
      {List<SearchresultoneItemModel>? searchresultoneItemList}) {
    return SearchResultOneModel(
      searchresultoneItemList:
          searchresultoneItemList ?? this.searchresultoneItemList,
    );
  }

  @override
  List<Object?> get props => [searchresultoneItemList];
}
