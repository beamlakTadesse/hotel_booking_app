import '../booking_completed_page/widgets/bookingcompleted_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class BookingCompletedPage extends StatefulWidget {
  const BookingCompletedPage({Key? key})
      : super(
          key: key,
        );

  @override
  BookingCompletedPageState createState() => BookingCompletedPageState();
}

class BookingCompletedPageState extends State<BookingCompletedPage>
    with AutomaticKeepAliveClientMixin<BookingCompletedPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 30.v),
              _buildBookingCompleted(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBookingCompleted(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return BookingcompletedItemWidget();
          },
        ),
      ),
    );
  }
}
