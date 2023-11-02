import 'package:flutter/material.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class RectangleItemWidget extends StatelessWidget {
  const RectangleItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgRectangle7,
        height: 100.v,
        width: 140.h,
        radius: BorderRadius.circular(
          16.h,
        ),
      ),
    );
  }
}
