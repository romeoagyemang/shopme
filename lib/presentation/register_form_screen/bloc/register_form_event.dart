// ignore_for_file: must_be_immutable

part of 'register_form_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RegisterForm widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RegisterFormEvent extends Equatable {}

/// Event that is dispatched when the RegisterForm widget is first created.
class RegisterFormInitialEvent extends RegisterFormEvent {
  @override
  List<Object?> get props => [];
}
