// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [search_result_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchResultModel extends Equatable {
  SearchResultModel() {}

  SearchResultModel copyWith() {
    return SearchResultModel();
  }

  @override
  List<Object?> get props => [];
}
