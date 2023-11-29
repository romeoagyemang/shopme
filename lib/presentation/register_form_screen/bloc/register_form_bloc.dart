import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shopme/presentation/register_form_screen/models/register_form_model.dart';
part 'register_form_event.dart';
part 'register_form_state.dart';

/// A bloc that manages the state of a RegisterForm according to the event that is dispatched to it.
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc(RegisterFormState initialState) : super(initialState) {
    on<RegisterFormInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RegisterFormInitialEvent event,
    Emitter<RegisterFormState> emit,
  ) async {
    emit(state.copyWith(
        fullNameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        passwordController1: TextEditingController()));
  }
}
