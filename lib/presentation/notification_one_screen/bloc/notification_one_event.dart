// ignore_for_file: must_be_immutable

part of 'notification_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NotificationOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NotificationOneEvent extends Equatable {}

/// Event that is dispatched when the NotificationOne widget is first created.
class NotificationOneInitialEvent extends NotificationOneEvent {
  @override
  List<Object?> get props => [];
}
