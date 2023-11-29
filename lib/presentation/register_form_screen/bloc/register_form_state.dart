// ignore_for_file: must_be_immutable

part of 'register_form_bloc.dart';

/// Represents the state of RegisterForm in the application.
class RegisterFormState extends Equatable {
  RegisterFormState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.passwordController1,
    this.registerFormModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  RegisterFormModel? registerFormModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        emailController,
        passwordController,
        passwordController1,
        registerFormModelObj,
      ];
  RegisterFormState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    RegisterFormModel? registerFormModelObj,
  }) {
    return RegisterFormState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      registerFormModelObj: registerFormModelObj ?? this.registerFormModelObj,
    );
  }
}
