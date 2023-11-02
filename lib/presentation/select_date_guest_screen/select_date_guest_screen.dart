import 'package:flutter/material.dart';import 'package:my_hotel_booking_app/core/app_export.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_title.dart';import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';import 'package:my_hotel_booking_app/widgets/custom_text_form_field.dart';import 'package:table_calendar/table_calendar.dart';
// ignore_for_file: must_be_immutable
class SelectDateGuestScreen extends StatelessWidget {SelectDateGuestScreen({Key? key}) : super(key: key);

DateTime? rangeStart;

DateTime? rangeEnd;

DateTime? selectedDay;

DateTime focusedDay = DateTime.now();

RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

TextEditingController decCounterController = TextEditingController();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v), child: Column(children: [SizedBox(height: 7.v), _buildDateCalendar(context), SizedBox(height: 20.v), _buildBookingDetails(context), SizedBox(height: 22.v), Text("lbl_total_435".tr, style: theme.textTheme.titleMedium)])), bottomNavigationBar: _buildContinue(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 52.v, leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "lbl_select_date".tr, margin: EdgeInsets.only(left: 16.h))); } 
/// Section Widget
Widget _buildDateCalendar(BuildContext context) { return SizedBox(height: 396.v, width: 380.h, child: TableCalendar(locale: 'en_US', firstDay: DateTime(DateTime.now().year - 5), lastDay: DateTime(DateTime.now().year + 5), calendarFormat: CalendarFormat.month, rangeSelectionMode: rangeSelectionMode, startingDayOfWeek: StartingDayOfWeek.sunday, headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true), calendarStyle: CalendarStyle(outsideDaysVisible: false, isTodayHighlighted: true), daysOfWeekStyle: DaysOfWeekStyle(), headerVisible: false, focusedDay: focusedDay, rangeStartDay: rangeStart, rangeEndDay: rangeEnd, onDaySelected: (selectedDay, focusedDay) {}, onRangeSelected: (start, end, focusedDay) {}, onPageChanged: (focusedDay) {})); } 
/// Section Widget
Widget _buildBookingDetails(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_check_in".tr, style: theme.textTheme.titleMedium), SizedBox(height: 11.v), CustomTextFormField(width: 160.h, controller: decCounterController, hintText: "lbl_dec_16".tr, textInputAction: TextInputAction.done, suffix: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgIconlyCurvedCalendarPrimary, height: 20.adaptSize, width: 20.adaptSize)), suffixConstraints: BoxConstraints(maxHeight: 56.v), contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v))]), CustomImageView(imagePath: ImageConstant.imgMenuWhiteA70020x20, height: 20.adaptSize, width: 20.adaptSize, margin: EdgeInsets.only(top: 51.v, bottom: 18.v)), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_check_out".tr, style: theme.textTheme.titleMedium), SizedBox(height: 11.v), Container(width: 160.h, padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.v), decoration: AppDecoration.fillBlueGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.symmetric(vertical: 1.v), child: Text("lbl_dec_20".tr, style: CustomTextStyles.titleSmallWhiteA700)), CustomImageView(imagePath: ImageConstant.imgIconlyCurvedCalendarPrimary, height: 20.adaptSize, width: 20.adaptSize)]))])]), SizedBox(height: 30.v), Text("lbl_guest".tr, style: theme.textTheme.titleMedium), SizedBox(height: 15.v), Container(padding: EdgeInsets.symmetric(horizontal: 82.h, vertical: 11.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(height: 52.adaptSize, width: 52.adaptSize, padding: EdgeInsets.all(16.h), decoration: AppDecoration.outlineIndigoA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrameWhiteA70020x20, height: 20.adaptSize, width: 20.adaptSize, alignment: Alignment.center)), Padding(padding: EdgeInsets.only(top: 10.v, bottom: 12.v), child: Text("lbl_3".tr, style: theme.textTheme.headlineSmall)), Container(height: 52.adaptSize, width: 52.adaptSize, padding: EdgeInsets.all(16.h), decoration: AppDecoration.outlineIndigoA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrame20x20, height: 20.adaptSize, width: 20.adaptSize, alignment: Alignment.center))]))]); } 
/// Section Widget
Widget _buildContinue(BuildContext context) { return CustomElevatedButton(text: "lbl_continue".tr, margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 33.v), onPressed: () {onTapContinue(context);}); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the bookingNameTabContainerScreen when the action is triggered.
onTapContinue(BuildContext context) { Navigator.pushNamed(context, AppRoutes.bookingNameTabContainerScreen); } 
 }
