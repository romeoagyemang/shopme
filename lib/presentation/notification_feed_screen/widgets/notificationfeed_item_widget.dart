import '../models/notificationfeed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopme/core/app_export.dart';

// ignore: must_be_immutable
class NotificationfeedItemWidget extends StatelessWidget {
  NotificationfeedItemWidget(
    this.notificationfeedItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationfeedItemModel notificationfeedItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.h,
        vertical: 1.v,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: notificationfeedItemModelObj.newProduct,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(
              top: 2.v,
              bottom: 40.v,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationfeedItemModelObj.newProduct1!,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 6.v),
                  SizedBox(
                    width: 269.h,
                    child: Text(
                      notificationfeedItemModelObj.nikeAirZoomPegasus!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.80,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.v),
                  Text(
                    notificationfeedItemModelObj.time!,
                    style: CustomTextStyles.bodySmallOnPrimary10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
