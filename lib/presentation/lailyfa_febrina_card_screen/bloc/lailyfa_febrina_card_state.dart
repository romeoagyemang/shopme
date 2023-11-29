// ignore_for_file: must_be_immutable

part of 'lailyfa_febrina_card_bloc.dart';

/// Represents the state of LailyfaFebrinaCard in the application.
class LailyfaFebrinaCardState extends Equatable {
  LailyfaFebrinaCardState({
    this.cardNumberEditTextController,
    this.expirationDateEditTextController,
    this.securityCodeEditTextController,
    this.cardHolderNameEditTextController,
    this.lailyfaFebrinaCardModelObj,
  });

  TextEditingController? cardNumberEditTextController;

  TextEditingController? expirationDateEditTextController;

  TextEditingController? securityCodeEditTextController;

  TextEditingController? cardHolderNameEditTextController;

  LailyfaFebrinaCardModel? lailyfaFebrinaCardModelObj;

  @override
  List<Object?> get props => [
        cardNumberEditTextController,
        expirationDateEditTextController,
        securityCodeEditTextController,
        cardHolderNameEditTextController,
        lailyfaFebrinaCardModelObj,
      ];
  LailyfaFebrinaCardState copyWith({
    TextEditingController? cardNumberEditTextController,
    TextEditingController? expirationDateEditTextController,
    TextEditingController? securityCodeEditTextController,
    TextEditingController? cardHolderNameEditTextController,
    LailyfaFebrinaCardModel? lailyfaFebrinaCardModelObj,
  }) {
    return LailyfaFebrinaCardState(
      cardNumberEditTextController:
          cardNumberEditTextController ?? this.cardNumberEditTextController,
      expirationDateEditTextController: expirationDateEditTextController ??
          this.expirationDateEditTextController,
      securityCodeEditTextController:
          securityCodeEditTextController ?? this.securityCodeEditTextController,
      cardHolderNameEditTextController: cardHolderNameEditTextController ??
          this.cardHolderNameEditTextController,
      lailyfaFebrinaCardModelObj:
          lailyfaFebrinaCardModelObj ?? this.lailyfaFebrinaCardModelObj,
    );
  }
}
