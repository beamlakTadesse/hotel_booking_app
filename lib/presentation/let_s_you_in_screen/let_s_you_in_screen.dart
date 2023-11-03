import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';
import 'package:my_hotel_booking_app/data/user_auth.dart';
import 'package:my_hotel_booking_app/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:my_hotel_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';

class LetSYouInScreen extends StatelessWidget {
  const LetSYouInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 47.v),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(height: 76.v),
                  Text("lbl_let_s_you_in".tr,
                      style: theme.textTheme.displayMedium),
                  SizedBox(height: 90.v),
                  _buildSocial(context),
                  SizedBox(height: 58.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup16,
                      height: 9.v,
                      width: 360.h),
                  SizedBox(height: 57.v),
                  CustomElevatedButton(
                      text: "msg_sign_in_with_password".tr,
                      onPressed: () {
                        onTapSignInWithPassword(context);
                      }),
                  Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("msg_don_t_have_an_account".tr,
                            style: CustomTextStyles.bodyMediumGray50_1)),
                    GestureDetector(
                        onTap: () {
                          onTapTxtSignUp(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text("lbl_sign_up".tr,
                                style: theme.textTheme.titleSmall)))
                  ])
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 50.v,
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.fromLTRB(24.h, 11.v, 376.h, 11.v),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildSocial(BuildContext context) {
    return Column(children: [
      CustomElevatedButton(
          height: 60.v,
          text: "msg_continue_with_facebook".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 12.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLogosfacebook,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillBlueGrayTL16,
          buttonTextStyle: CustomTextStyles.titleMediumSemiBold),
      SizedBox(height: 16.v),
      CustomElevatedButton(
          onPressed: () async {
            var user = await UserAuthentication().signInWithGoogle();
            print(user.credential);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HomeScreenContainerScreen())));
          },
          height: 60.v,
          text: "msg_continue_with_google".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 11.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrame,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillBlueGrayTL16,
          buttonTextStyle: CustomTextStyles.titleMediumSemiBold),
      SizedBox(height: 16.v),
      CustomElevatedButton(
          height: 60.v,
          text: "msg_continue_with_apple".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 12.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrameWhiteA700,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillBlueGrayTL16,
          buttonTextStyle: CustomTextStyles.titleMediumSemiBold)
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapSignInWithPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }

  /// Navigates to the signUpBlankScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpBlankScreen);
  }
}
