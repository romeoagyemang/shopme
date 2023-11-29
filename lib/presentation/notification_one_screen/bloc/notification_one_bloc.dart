import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shopme/presentation/notification_one_screen/models/notification_one_model.dart';
part 'notification_one_event.dart';
part 'notification_one_state.dart';

/// A bloc that manages the state of a NotificationOne according to the event that is dispatched to it.
class NotificationOneBloc
    extends Bloc<NotificationOneEvent, NotificationOneState> {
  NotificationOneBloc(NotificationOneState initialState) : super(initialState) {
    on<NotificationOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationOneInitialEvent event,
    Emitter<NotificationOneState> emit,
  ) async {}
}
