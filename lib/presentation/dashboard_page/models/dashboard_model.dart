// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'slider_item_model.dart';
import 'list_item_model.dart';
import 'flashsalelist_item_model.dart';
import 'megasalelist_item_model.dart';
import 'dashboard_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({
    this.sliderItemList = const [],
    this.listItemList = const [],
    this.flashsalelistItemList = const [],
    this.megasalelistItemList = const [],
    this.dashboardItemList = const [],
  }) {}

  List<SliderItemModel> sliderItemList;

  List<ListItemModel> listItemList;

  List<FlashsalelistItemModel> flashsalelistItemList;

  List<MegasalelistItemModel> megasalelistItemList;

  List<DashboardItemModel> dashboardItemList;

  DashboardModel copyWith({
    List<SliderItemModel>? sliderItemList,
    List<ListItemModel>? listItemList,
    List<FlashsalelistItemModel>? flashsalelistItemList,
    List<MegasalelistItemModel>? megasalelistItemList,
    List<DashboardItemModel>? dashboardItemList,
  }) {
    return DashboardModel(
      sliderItemList: sliderItemList ?? this.sliderItemList,
      listItemList: listItemList ?? this.listItemList,
      flashsalelistItemList:
          flashsalelistItemList ?? this.flashsalelistItemList,
      megasalelistItemList: megasalelistItemList ?? this.megasalelistItemList,
      dashboardItemList: dashboardItemList ?? this.dashboardItemList,
    );
  }

  @override
  List<Object?> get props => [
        sliderItemList,
        listItemList,
        flashsalelistItemList,
        megasalelistItemList,
        dashboardItemList
      ];
}
