// ignore_for_file: must_be_immutable

part of 'search_result_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SearchResultOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchResultOneEvent extends Equatable {}

/// Event that is dispatched when the SearchResultOne widget is first created.
class SearchResultOneInitialEvent extends SearchResultOneEvent {
  @override
  List<Object?> get props => [];
}
