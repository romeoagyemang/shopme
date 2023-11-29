// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [showonlychipview_item_widget] screen.
class ShowonlychipviewItemModel extends Equatable {
  ShowonlychipviewItemModel({
    this.freeReturns,
    this.isSelected,
  }) {
    freeReturns = freeReturns ?? "Free Returns";
    isSelected = isSelected ?? false;
  }

  String? freeReturns;

  bool? isSelected;

  ShowonlychipviewItemModel copyWith({
    String? freeReturns,
    bool? isSelected,
  }) {
    return ShowonlychipviewItemModel(
      freeReturns: freeReturns ?? this.freeReturns,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [freeReturns, isSelected];
}
