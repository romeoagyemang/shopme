// ignore_for_file: must_be_immutable

part of 'offer_screen_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OfferScreenOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OfferScreenOneEvent extends Equatable {}

/// Event that is dispatched when the OfferScreenOne widget is first created.
class OfferScreenOneInitialEvent extends OfferScreenOneEvent {
  @override
  List<Object?> get props => [];
}
