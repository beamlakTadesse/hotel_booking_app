import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_hotel_booking_app/core/app_export.dart';
import 'package:my_hotel_booking_app/data/user_auth.dart';
import 'package:my_hotel_booking_app/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:my_hotel_booking_app/widgets/custom_checkbox_button.dart';
import 'package:my_hotel_booking_app/widgets/custom_elevated_button.dart';
import 'package:my_hotel_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberme = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late dynamic user;
  bool loading = false;

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
                      SizedBox(height: 70.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 281.h,
                              margin: EdgeInsets.only(right: 99.h),
                              child: Text("msg_login_to_your_account".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(height: 1.50)))),
                      SizedBox(height: 21.v),
                      _buildLoginSection(context),
                      SizedBox(height: 57.v),
                      _buildOrDividerSection(context),
                      SizedBox(height: 33.v),
                      _buildSocialMediaSection(context),
                      SizedBox(height: 49.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text("msg_don_t_have_an_account".tr,
                                    style:
                                        CustomTextStyles.bodyMediumGray50_1)),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtSignUp(context);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Text("lbl_sign_up".tr,
                                        style: theme.textTheme.titleSmall)))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildLoginSection(BuildContext context) {
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
      SizedBox(height: 24.v),
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
                  imagePath: ImageConstant.imgDashboardBlueGray100,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 60.v),
          obscureText: true,
          contentPadding: EdgeInsets.symmetric(vertical: 21.v)),
      SizedBox(height: 24.v),
      CustomCheckboxButton(
          text: "lbl_remember_me".tr,
          value: rememberme,
          padding: EdgeInsets.symmetric(vertical: 2.v),
          onChange: (value) {
            rememberme = value;
          }),
      SizedBox(height: 24.v),
      loading
          ? SpinKitRing(
              duration: const Duration(milliseconds: 500),
              lineWidth: 1.5,
              size: 22,
              color: Colors.white,
            )
          : SizedBox(),
      CustomElevatedButton(
        text: "lbl_sign_in2".tr,
        onPressed: () async {
          setState(() {
            loading = true;
          });
          if (emailController.text != '' && passwordController.text != '') {
            user = await UserAuthentication().login(
                emailAddress: emailController.text,
                password: passwordController.text);
          }

          if (user is UserCredential) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HomeScreenContainerScreen())));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(user)));
          }
        },
      ),
      SizedBox(height: 28.v),
      Align(
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: () {
                onTapTxtForgotThePassword(context);
              },
              child: Text("msg_forgot_the_password".tr,
                  style: CustomTextStyles.titleMediumPrimarySemiBold)))
    ]);
  }

  /// Section Widget
  Widget _buildOrDividerSection(BuildContext context) {
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
  Widget _buildSocialMediaSection(BuildContext context) {
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
                alignment: Alignment.center,
                onTap: (() async {
                  user = await UserAuthentication().signInWithGoogle();

                  if (user is UserCredential) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                HomeScreenContainerScreen())));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(user)));
                  }
                }),
              )),
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

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotThePassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  /// Navigates to the signUpBlankScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpBlankScreen);
  }
}
