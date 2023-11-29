// ignore_for_file: must_be_immutable

part of 'offer_screen_one_bloc.dart';

/// Represents the state of OfferScreenOne in the application.
class OfferScreenOneState extends Equatable {
  OfferScreenOneState({this.offerScreenOneModelObj});

  OfferScreenOneModel? offerScreenOneModelObj;

  @override
  List<Object?> get props => [
        offerScreenOneModelObj,
      ];
  OfferScreenOneState copyWith({OfferScreenOneModel? offerScreenOneModelObj}) {
    return OfferScreenOneState(
      offerScreenOneModelObj:
          offerScreenOneModelObj ?? this.offerScreenOneModelObj,
    );
  }
}
