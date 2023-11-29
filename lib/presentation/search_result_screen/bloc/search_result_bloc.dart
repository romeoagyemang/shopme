import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shopme/presentation/search_result_screen/models/search_result_model.dart';
part 'search_result_event.dart';
part 'search_result_state.dart';

/// A bloc that manages the state of a SearchResult according to the event that is dispatched to it.
class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc(SearchResultState initialState) : super(initialState) {
    on<SearchResultInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SearchResultInitialEvent event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
  }
}
