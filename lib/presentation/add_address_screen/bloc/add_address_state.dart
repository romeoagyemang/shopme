// ignore_for_file: must_be_immutable

part of 'add_address_bloc.dart';

/// Represents the state of AddAddress in the application.
class AddAddressState extends Equatable {
  AddAddressState({
    this.countryController,
    this.firstNameController,
    this.lastNameController,
    this.streetAddressController,
    this.streetAddressTwoController,
    this.cityController,
    this.oldPasswordController,
    this.zipCodeController,
    this.phoneNumberController,
    this.addAddressModelObj,
  });

  TextEditingController? countryController;

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? streetAddressController;

  TextEditingController? streetAddressTwoController;

  TextEditingController? cityController;

  TextEditingController? oldPasswordController;

  TextEditingController? zipCodeController;

  TextEditingController? phoneNumberController;

  AddAddressModel? addAddressModelObj;

  @override
  List<Object?> get props => [
        countryController,
        firstNameController,
        lastNameController,
        streetAddressController,
        streetAddressTwoController,
        cityController,
        oldPasswordController,
        zipCodeController,
        phoneNumberController,
        addAddressModelObj,
      ];
  AddAddressState copyWith({
    TextEditingController? countryController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? streetAddressController,
    TextEditingController? streetAddressTwoController,
    TextEditingController? cityController,
    TextEditingController? oldPasswordController,
    TextEditingController? zipCodeController,
    TextEditingController? phoneNumberController,
    AddAddressModel? addAddressModelObj,
  }) {
    return AddAddressState(
      countryController: countryController ?? this.countryController,
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      streetAddressController:
          streetAddressController ?? this.streetAddressController,
      streetAddressTwoController:
          streetAddressTwoController ?? this.streetAddressTwoController,
      cityController: cityController ?? this.cityController,
      oldPasswordController:
          oldPasswordController ?? this.oldPasswordController,
      zipCodeController: zipCodeController ?? this.zipCodeController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      addAddressModelObj: addAddressModelObj ?? this.addAddressModelObj,
    );
  }
}
