import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';
import 'package:my_hotel_booking_app/data/user_auth.dart';
import 'package:my_hotel_booking_app/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:my_hotel_booking_app/widgets/custom_checkbox_button.dart';
import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';
import 'package:my_hotel_booking_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpBlankScreen extends StatefulWidget {
  SignUpBlankScreen({Key? key}) : super(key: key);

  @override
  State<SignUpBlankScreen> createState() => _SignUpBlankScreenState();
}

class _SignUpBlankScreenState extends State<SignUpBlankScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  bool rememberme = false;
  bool loading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      SizedBox(height: 84.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 257.h,
                              child: Text("msg_create_your_account".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(height: 1.50)))),
                      SizedBox(height: 36.v),
                      _buildCreateAccountForm(context),
                      SizedBox(height: 60.v),
                      _buildOrDivider(context),
                      SizedBox(height: 31.v),
                      _buildSocial(context),
                      SizedBox(height: 60.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("msg_already_have_an".tr,
                                style: CustomTextStyles.bodyMediumGray50_1),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtSignIn(context);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Text("lbl_sign_in".tr,
                                        style: theme.textTheme.titleSmall)))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildCreateAccountForm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomTextFormField(
          controller: emailController,
          hintText: "lbl_email".tr,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 60.v),
          contentPadding:
              EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v)),
      SizedBox(height: 20.v),
      CustomTextFormField(
          controller: passwordController,
          hintText: "lbl_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 60.v),
          suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgDashboard,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 60.v),
          obscureText: true,
          contentPadding: EdgeInsets.symmetric(vertical: 21.v)),
      SizedBox(height: 20.v),
      CustomTextFormField(
          controller: confPasswordController,
          hintText: 'confirm password',
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 60.v),
          suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgDashboard,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 60.v),
          obscureText: true,
          contentPadding: EdgeInsets.symmetric(vertical: 21.v)),
      SizedBox(height: 20.v),
      CustomCheckboxButton(
          text: "lbl_remember_me".tr,
          value: rememberme,
          padding: EdgeInsets.symmetric(vertical: 3.v),
          onChange: (value) {
            rememberme = value;
          }),
      SizedBox(height: 15.v),
      loading
          ? SpinKitRing(
              duration: const Duration(milliseconds: 500),
              lineWidth: 1.5,
              size: 22,
              color: Colors.white,
            )
          : SizedBox(),
      CustomElevatedButton(
          text: "lbl_sign_up2".tr,
          onPressed: () async {
            setState(() {
              loading = true;
            });
            var user = await UserAuthentication().createUser(
                emailAddress: emailController.text,
                password: passwordController.text);

            if (user is UserCredential) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => HomeScreenContainerScreen())));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(user)));
            }
          })
    ]);
  }

  /// Section Widget
  Widget _buildOrDivider(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  child: SizedBox(width: 96.h, child: Divider())),
              Text("msg_or_continue_with".tr,
                  style: CustomTextStyles.titleMediumGray50),
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  child: SizedBox(width: 96.h, child: Divider()))
            ]));
  }

  /// Section Widget
  Widget _buildSocial(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 60.v,
              width: 88.h,
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLogosfacebook,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center)),
          Container(
              height: 60.v,
              width: 87.h,
              margin: EdgeInsets.only(left: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrame,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center)),
          Container(
              height: 60.v,
              width: 88.h,
              margin: EdgeInsets.only(left: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 17.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFrameWhiteA700,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the fillProfileScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
  }

  /// Navigates to the fillProfileScreen when the action is triggered.
  onTapTxtSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}
