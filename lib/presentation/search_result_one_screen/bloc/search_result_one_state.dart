// ignore_for_file: must_be_immutable

part of 'search_result_one_bloc.dart';

/// Represents the state of SearchResultOne in the application.
class SearchResultOneState extends Equatable {
  SearchResultOneState({
    this.searchController,
    this.searchResultOneModelObj,
  });

  TextEditingController? searchController;

  SearchResultOneModel? searchResultOneModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchResultOneModelObj,
      ];
  SearchResultOneState copyWith({
    TextEditingController? searchController,
    SearchResultOneModel? searchResultOneModelObj,
  }) {
    return SearchResultOneState(
      searchController: searchController ?? this.searchController,
      searchResultOneModelObj:
          searchResultOneModelObj ?? this.searchResultOneModelObj,
    );
  }
}
