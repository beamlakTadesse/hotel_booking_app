import '../notifications_screen/widgets/sectionlist_item_widget.dart';import 'package:flutter/material.dart';import 'package:grouped_list/grouped_list.dart';import 'package:my_hotel_booking_app/core/app_export.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_title.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_trailing_image.dart';import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';
// ignore_for_file: must_be_immutable
class NotificationsScreen extends StatelessWidget {NotificationsScreen({Key? key}) : super(key: key);

List sectionlistItemList = [{'id' : 1, 'groupBy' : "Today"}, {'id' : 2, 'groupBy' : "Today"}, {'id' : 3, 'groupBy' : "Yesterday"}, {'id' : 4, 'groupBy' : "Yesterday"}];

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: Padding(padding: EdgeInsets.fromLTRB(24.h, 31.v, 24.h, 5.v), child: GroupedListView<dynamic, String>(shrinkWrap: true, stickyHeaderBackgroundColor: Colors.transparent, elements: sectionlistItemList, groupBy: (element) => element['groupBy'], sort: false, groupSeparatorBuilder: (String value) {return Padding(padding: EdgeInsets.only(top: 25.v, bottom: 22.v), child: Text(value, style: CustomTextStyles.titleMediumSemiBold_1.copyWith(color: appTheme.whiteA700)));}, itemBuilder: (context, model) {return SectionlistItemWidget();}, separator: SizedBox(height: 24.v))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 52.v, leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "lbl_notifications".tr, margin: EdgeInsets.only(left: 16.h)), actions: [AppbarTrailingImage(imagePath: ImageConstant.imgClock, margin: EdgeInsets.fromLTRB(24.h, 11.v, 24.h, 13.v))]); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }
