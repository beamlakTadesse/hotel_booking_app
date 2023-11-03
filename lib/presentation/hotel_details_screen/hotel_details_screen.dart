import 'package:my_hotel_booking_app/presentation/gallery_screen/gallery_screen.dart';
import 'package:my_hotel_booking_app/presentation/select_date_guest_screen/select_date_guest_screen.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../hotel_details_screen/widgets/framenineteen_item_widget.dart';
import '../hotel_details_screen/widgets/rectangle_item_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildEightySeven(context),
                          SizedBox(height: 24.v),
                          _buildHotelDetails(context),
                          SizedBox(height: 35.v),
                          _buildGalleryPhotos(context),
                          SizedBox(height: 32.v),
                          _buildDetails(context),
                          SizedBox(height: 33.v),
                          _buildDescription(context),
                          SizedBox(height: 31.v),
                          _buildFacilities(context),
                          SizedBox(height: 31.v),
                          _buildLocation(context),
                          SizedBox(height: 32.v),
                          _buildReview(context),
                          SizedBox(height: 40.v),
                          _buildPrice(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 50.v,
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 11.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgBookmark,
              margin: EdgeInsets.only(left: 24.h, top: 11.v, right: 11.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgClock,
              margin: EdgeInsets.only(left: 20.h, top: 11.v, right: 35.h))
        ]);
  }

  /// Section Widget
  Widget _buildEightySeven(BuildContext context) {
    return SizedBox(
        height: 206.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle6,
              height: 206.v,
              width: 428.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 164.h, vertical: 12.v),
                  decoration: AppDecoration.gradient,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 176.v),
                        SizedBox(
                            height: 6.v,
                            child: AnimatedSmoothIndicator(
                                activeIndex: 0,
                                count: 5,
                                effect: ScrollingDotsEffect(
                                    spacing: 11,
                                    activeDotColor: theme.colorScheme.primary,
                                    dotColor: appTheme.gray700,
                                    dotHeight: 6.v,
                                    dotWidth: 6.h)))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildHotelDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_royale_president".tr, style: theme.textTheme.headlineLarge),
          SizedBox(height: 15.v),
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 20.adaptSize,
                width: 20.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("lbl_france".tr,
                    style: CustomTextStyles.bodyMediumGray50_1))
          ])
        ]));
  }

  /// Section Widget
  Widget _buildGalleryPhotos(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("lbl_gallery_photos".tr, style: theme.textTheme.titleMedium),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => GalleryScreen())));
                  // onTapTxtSeeAll(context);
                },
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Text("lbl_see_all".tr,
                        style: CustomTextStyles.titleMediumPrimary16)))
          ]),
          SizedBox(height: 16.v),
          SizedBox(
              height: 100.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 88.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RectangleItemWidget();
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_details".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 18.v),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(left: 28.h, right: 19.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFramePrimary,
                              height: 32.adaptSize,
                              width: 32.adaptSize),
                          SizedBox(height: 7.v),
                          Text("lbl_hotels".tr,
                              style: theme.textTheme.labelLarge)
                        ]),
                        Spacer(flex: 41),
                        Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFramePrimary32x32,
                              height: 32.adaptSize,
                              width: 32.adaptSize),
                          SizedBox(height: 7.v),
                          Text("lbl_4_bedrooms".tr,
                              style: theme.textTheme.labelLarge)
                        ]),
                        Spacer(flex: 27),
                        Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFrame32x32,
                              height: 32.adaptSize,
                              width: 32.adaptSize),
                          SizedBox(height: 7.v),
                          Text("lbl_2_bathrooms".tr,
                              style: theme.textTheme.labelLarge)
                        ]),
                        Spacer(flex: 31),
                        Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFrame1,
                              height: 32.adaptSize,
                              width: 32.adaptSize),
                          SizedBox(height: 8.v),
                          Text("lbl_4000_sqft".tr,
                              style: theme.textTheme.labelLarge)
                        ])
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_description".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 17.v),
          SizedBox(
              width: 379.h,
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "msg_lorem_ipsum_dolor3".tr,
                        style: CustomTextStyles.bodyMediumGray50),
                    TextSpan(
                        text: "lbl_read_more".tr,
                        style: theme.textTheme.titleSmall)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Section Widget
  Widget _buildFacilities(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_facilites".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 22.v),
          Padding(
              padding: EdgeInsets.only(left: 3.h, right: 25.h),
              child: Row(children: [
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgCut,
                      height: 24.v,
                      width: 26.h),
                  SizedBox(height: 12.v),
                  Text("lbl_swimming_pool".tr,
                      style: theme.textTheme.labelLarge)
                ]),
                Spacer(flex: 29),
                Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgSignal,
                          height: 18.v,
                          width: 26.h),
                      SizedBox(height: 13.v),
                      Text("lbl_wifi".tr, style: theme.textTheme.labelLarge)
                    ])),
                Spacer(flex: 37),
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgCutPrimary,
                      height: 23.v,
                      width: 25.h),
                  SizedBox(height: 11.v),
                  Text("lbl_restaurant".tr, style: theme.textTheme.labelLarge)
                ]),
                Spacer(flex: 33),
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgTwitter,
                      height: 24.v,
                      width: 32.h),
                  SizedBox(height: 12.v),
                  Text("lbl_parking".tr, style: theme.textTheme.labelLarge)
                ])
              ])),
          SizedBox(height: 21.v),
          Padding(
              padding: EdgeInsets.only(left: 6.h, right: 5.h),
              child: Row(children: [
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgOffer,
                      height: 26.v,
                      width: 21.h),
                  SizedBox(height: 11.v),
                  Text("lbl_meeting_room".tr, style: theme.textTheme.labelLarge)
                ]),
                Spacer(flex: 48),
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgVectorPrimary24x24,
                      height: 24.adaptSize,
                      width: 24.adaptSize),
                  SizedBox(height: 11.v),
                  Text("lbl_elevator".tr, style: theme.textTheme.labelLarge)
                ]),
                Spacer(flex: 51),
                Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 26.adaptSize,
                      width: 26.adaptSize),
                  SizedBox(height: 9.v),
                  Text("lbl_fitness_center".tr,
                      style: theme.textTheme.labelLarge)
                ]),
                Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 26.adaptSize,
                          width: 26.adaptSize),
                      SizedBox(height: 11.v),
                      Text("lbl_24_hours_open".tr,
                          style: theme.textTheme.labelLarge)
                    ]))
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_location".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 18.v),
          SizedBox(
              height: 180.v,
              width: 380.h,
              child: Stack(alignment: Alignment.center, children: [
                SizedBox(
                    height: 180.v,
                    width: 380.h,
                    child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(37.43296265331129, -122.08832357078792),
                            zoom: 14.4746),
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController.complete(controller);
                        },
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: false,
                        myLocationButtonEnabled: false,
                        myLocationEnabled: false)),
                CustomImageView(
                    imagePath: ImageConstant.imgLocation,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    alignment: Alignment.center)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildReview(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: (() {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            true, // set to false if you want to force a rating
                        builder: (context) => _dialog,
                      );
                    }),
                    child: Text("lbl_review".tr,
                        style: theme.textTheme.titleMedium)),
                CustomImageView(
                    imagePath: ImageConstant.imgStarYellowA700,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(left: 21.h, bottom: 4.v)),
                Padding(
                    padding: EdgeInsets.only(left: 4.h, bottom: 2.v),
                    child: Text("lbl_4_8".tr,
                        style: CustomTextStyles.titleMediumPrimarySemiBold)),
                Padding(
                    padding: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 3.v),
                    child: Text("lbl_4_981_reviews".tr,
                        style: theme.textTheme.bodySmall)),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      onTapTxtSeeAll1(context);
                    },
                    child: Text("lbl_see_all".tr,
                        style: CustomTextStyles.titleMediumPrimary16))
              ]),
          SizedBox(height: 19.v),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.v);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return FramenineteenItemWidget();
              }),
          SizedBox(height: 20.v),
          CustomElevatedButton(
              height: 52.v,
              text: "lbl_more".tr,
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 16.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdown,
                      height: 20.adaptSize,
                      width: 20.adaptSize)),
              buttonStyle: CustomButtonStyles.fillGray)
        ]));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 9.v),
              child: Text("lbl_29".tr,
                  style: CustomTextStyles.headlineLargePrimary)),
          Padding(
              padding: EdgeInsets.only(left: 4.h, top: 20.v, bottom: 21.v),
              child: Text("lbl_night".tr,
                  style: CustomTextStyles.bodyMediumGray40001)),
          CustomElevatedButton(
              height: 58.v,
              width: 263.h,
              text: "lbl_book_now".tr,
              margin: EdgeInsets.only(left: 17.h),
              buttonStyle: CustomButtonStyles.outlineGreenAF,
              onPressed: () {
                onTapBookNow(context);
              })
        ]));
  }

  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'Rating',
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Rate this hotel',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15, color: Colors.black),
    ),

    submitButtonText: 'Submit',
    commentHint: 'write your comment',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
    },
  );

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the galleryScreen when the action is triggered.
  onTapTxtSeeAll(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.galleryScreen);
  }

  onTapTxtSeeAll1(BuildContext context) {
    // TODO: implement Actions
  }

  /// Navigates to the selectDateGuestScreen when the action is triggered.
  onTapBookNow(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.selectDateGuestScreen);
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => SelectDateGuestScreen())));
  }
}
