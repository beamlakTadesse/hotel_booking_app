import 'package:flutter/material.dart';import 'package:my_hotel_booking_app/core/app_export.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_title.dart';import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';import 'package:my_hotel_booking_app/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class AddNewCardScreen extends StatelessWidget {AddNewCardScreen({Key? key}) : super(key: key);

TextEditingController nameEditTextController = TextEditingController();

TextEditingController numberEditTextController = TextEditingController();

TextEditingController expiryDateEditTextController = TextEditingController();

TextEditingController cvvEditTextController = TextEditingController();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 27.v), child: Column(children: [CustomImageView(imagePath: ImageConstant.imgCard1, height: 240.v, width: 380.h), SizedBox(height: 28.v), _buildNameEditText(context), SizedBox(height: 28.v), _buildNumberEditText(context), SizedBox(height: 28.v), _buildExpiryAndCvvNumberRow(context), SizedBox(height: 5.v)])), bottomNavigationBar: _buildAddNewCardButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 52.v, leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "lbl_add_new_card".tr, margin: EdgeInsets.only(left: 16.h))); } 
/// Section Widget
Widget _buildNameEditText(BuildContext context) { return CustomTextFormField(controller: nameEditTextController, hintText: "lbl_daniel_austin".tr); } 
/// Section Widget
Widget _buildNumberEditText(BuildContext context) { return CustomTextFormField(controller: numberEditTextController, hintText: "msg_6373_2728_4797_4679".tr); } 
/// Section Widget
Widget _buildExpiryDateEditText(BuildContext context) { return Expanded(child: Padding(padding: EdgeInsets.only(right: 8.h), child: CustomTextFormField(controller: expiryDateEditTextController, hintText: "lbl_02_30".tr))); } 
/// Section Widget
Widget _buildCvvEditText(BuildContext context) { return Expanded(child: Padding(padding: EdgeInsets.only(left: 8.h), child: CustomTextFormField(controller: cvvEditTextController, hintText: "lbl_190".tr, textInputAction: TextInputAction.done))); } 
/// Section Widget
Widget _buildExpiryAndCvvNumberRow(BuildContext context) { return Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildExpiryDateEditText(context), _buildCvvEditText(context)]); } 
/// Section Widget
Widget _buildAddNewCardButton(BuildContext context) { return CustomElevatedButton(text: "lbl_add_new_card".tr, margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 49.v)); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }
