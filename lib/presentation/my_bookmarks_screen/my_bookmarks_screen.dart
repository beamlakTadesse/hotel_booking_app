import '../my_bookmarks_screen/widgets/mybookmarks_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';

class MyBookmarksScreen extends StatelessWidget {
  const MyBookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 281.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 24.h,
                        crossAxisSpacing: 24.h),
                    physics: BouncingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return MybookmarksItemWidget(onTapImgImage: () {
                        onTapImgImage(context);
                      });
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "lbl_my_bookmarks".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenuWhiteA700,
              margin: EdgeInsets.only(left: 24.h, top: 11.v, right: 16.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgGrid,
              margin: EdgeInsets.only(left: 20.h, top: 11.v, right: 40.h))
        ]);
  }

  onTapImgImage(BuildContext context) {}

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
