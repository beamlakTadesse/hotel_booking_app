import '../booking_ongoing_page/widgets/bookingongoing_item_widget.dart';import 'package:flutter/material.dart';import 'package:my_hotel_booking_app/core/app_export.dart';class BookingOngoingPage extends StatefulWidget {const BookingOngoingPage({Key? key}) : super(key: key);

@override BookingOngoingPageState createState() =>  BookingOngoingPageState();

 }
class BookingOngoingPageState extends State<BookingOngoingPage> with  AutomaticKeepAliveClientMixin<BookingOngoingPage> {@override bool get wantKeepAlive =>  true;

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: Container(width: double.maxFinite, decoration: AppDecoration.fillOnPrimary, child: Column(children: [SizedBox(height: 30.v), _buildBookingOngoing(context)])))); } 
/// Section Widget
Widget _buildBookingOngoing(BuildContext context) { return Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.h), child: ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: 20.v);}, itemCount: 2, itemBuilder: (context, index) {return BookingongoingItemWidget(onTapBookingActionCancelBookingButton: () {onTapBookingActionCancelBookingButton(context);}, onTapBookingActionViewTicketButton: () {onTapBookingActionViewTicketButton(context);});}))); } 

onTapBookingActionCancelBookingButton(BuildContext context) { // TODO: implement Actions
 } 
/// Navigates to the viewTicketScreen when the action is triggered.
onTapBookingActionViewTicketButton(BuildContext context) { Navigator.pushNamed(context, AppRoutes.viewTicketScreen); } 
 }
