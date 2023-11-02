import '../home_screen_page/widgets/hotelslist_item_widget.dart';import '../home_screen_page/widgets/martinezcannes_item_widget.dart';import 'package:flutter/material.dart';import 'package:my_hotel_booking_app/core/app_export.dart';class HomeScreenPage extends StatefulWidget {const HomeScreenPage({Key? key}) : super(key: key);

@override HomeScreenPageState createState() =>  HomeScreenPageState();

 }
class HomeScreenPageState extends State<HomeScreenPage> with  AutomaticKeepAliveClientMixin<HomeScreenPage> {@override bool get wantKeepAlive =>  true;

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(child: Column(children: [SizedBox(height: 30.v), Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.only(left: 24.h), child: Column(children: [_buildHotelsList(context), SizedBox(height: 34.v), _buildRecentlyBookedList(context)])))]))))); } 
/// Section Widget
Widget _buildHotelsList(BuildContext context) { return SizedBox(height: 400.v, child: ListView.separated(scrollDirection: Axis.horizontal, separatorBuilder: (context, index) {return SizedBox(width: 24.h);}, itemCount: 2, itemBuilder: (context, index) {return HotelslistItemWidget();})); } 
/// Section Widget
Widget _buildRecentlyBookedList(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(right: 24.h), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("lbl_recently_booked".tr, style: theme.textTheme.titleMedium), GestureDetector(onTap: () {onTapTxtSeeAll(context);}, child: Text("lbl_see_all".tr, style: CustomTextStyles.titleMediumPrimary16))])), SizedBox(height: 16.v), Padding(padding: EdgeInsets.only(right: 24.h), child: ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: 24.v);}, itemCount: 5, itemBuilder: (context, index) {return MartinezcannesItemWidget();}))]); } 
/// Navigates to the recentlyBookedScreen when the action is triggered.
onTapTxtSeeAll(BuildContext context) { Navigator.pushNamed(context, AppRoutes.recentlyBookedScreen); } 
 }
