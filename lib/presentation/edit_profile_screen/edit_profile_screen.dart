import 'package:flutter/material.dart';import 'package:my_hotel_booking_app/core/app_export.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';import 'package:my_hotel_booking_app/widgets/app_bar/appbar_title.dart';import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';import 'package:my_hotel_booking_app/widgets/custom_drop_down.dart';import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';import 'package:my_hotel_booking_app/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class EditProfileScreen extends StatelessWidget {EditProfileScreen({Key? key}) : super(key: key);

TextEditingController editProfileLabel1Controller = TextEditingController();

TextEditingController editProfileLabel2Controller = TextEditingController();

TextEditingController editProfileDateController = TextEditingController();

TextEditingController editProfileEmailController = TextEditingController();

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

TextEditingController editProfileFolderController = TextEditingController();

List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 43.v), child: Column(children: [_buildEditProfileLabel1(context), SizedBox(height: 24.v), _buildEditProfileLabel2(context), SizedBox(height: 24.v), _buildEditProfileDate(context), SizedBox(height: 24.v), _buildEditProfileEmail(context), SizedBox(height: 24.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgFavoriteWhiteA700, height: 20.adaptSize, width: 20.adaptSize)), hintText: "lbl_united_states".tr, items: dropdownItemList, onChanged: (value) {}), SizedBox(height: 24.v), _buildEditProfileFolder(context), SizedBox(height: 24.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgFavoriteWhiteA700, height: 20.adaptSize, width: 20.adaptSize)), hintText: "lbl_male".tr, items: dropdownItemList1, onChanged: (value) {}), SizedBox(height: 5.v)]))), bottomNavigationBar: _buildUpdateButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 52.v, leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "lbl_edit_profile".tr, margin: EdgeInsets.only(left: 16.h))); } 
/// Section Widget
Widget _buildEditProfileLabel1(BuildContext context) { return CustomTextFormField(controller: editProfileLabel1Controller, hintText: "lbl_daniel_austin".tr); } 
/// Section Widget
Widget _buildEditProfileLabel2(BuildContext context) { return CustomTextFormField(controller: editProfileLabel2Controller, hintText: "lbl_daniel".tr); } 
/// Section Widget
Widget _buildEditProfileDate(BuildContext context) { return CustomTextFormField(controller: editProfileDateController, hintText: "lbl_12_27_1995".tr, suffix: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgIconlyCurvedCalendarPrimary, height: 20.adaptSize, width: 20.adaptSize)), suffixConstraints: BoxConstraints(maxHeight: 56.v), contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v)); } 
/// Section Widget
Widget _buildEditProfileEmail(BuildContext context) { return CustomTextFormField(controller: editProfileEmailController, hintText: "lbl_uder_domain_com".tr, textInputType: TextInputType.emailAddress, suffix: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgIconlyCurvedMessage, height: 20.adaptSize, width: 20.adaptSize)), suffixConstraints: BoxConstraints(maxHeight: 56.v), contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v)); } 
/// Section Widget
Widget _buildEditProfileFolder(BuildContext context) { return CustomTextFormField(controller: editProfileFolderController, hintText: "msg_1_123_456_789_000".tr, textInputAction: TextInputAction.done, prefix: Padding(padding: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v), child: Row(mainAxisSize: MainAxisSize.min, children: [CustomImageView(imagePath: ImageConstant.imageNotFound, height: 18.v, width: 24.h, margin: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v)), CustomImageView(imagePath: ImageConstant.imageNotFound, height: 4.67.v, width: 9.33.h)])), prefixConstraints: BoxConstraints(maxHeight: 56.v), contentPadding: EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v)); } 
/// Section Widget
Widget _buildUpdateButton(BuildContext context) { return CustomElevatedButton(text: "lbl_update".tr, margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 49.v)); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }
