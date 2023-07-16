import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/auth/register/register_mobile_screen.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';

import '../../../../app/utils/preferences/preferences.dart';
import '../../../../main.dart';
import '../../../widgets/widgets.dart';
import '../forgot_password/forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopExit(
      child: DismissKeyBoard(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white),
          child: Container(
            decoration: AppDecoration.splash,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.transparent,
                resizeToAvoidBottomInset: false,
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      50.height,
                      AppLogo(
                        whiteLogo: true,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          AppStrings.letStarted,
                          style: AppStyle.white50,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          AppStrings.connectUser,
                          style: AppStyle.white14W400,
                        ),
                      ),

                      100.height,
                      AppButton(
                        title: AppStrings.login,
                        whiteButton: true,
                        onTap: () {
                          _showLoginSheet();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLoginSheet() {
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.hiWelcome,
                    style: AppStyle.black30W700,
                  ),
                  6.width,
                  Image.asset(AppImages.hand,width: 30,height: 30,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text(
                AppStrings.enterNumber4VerCode,
                style: AppStyle.grey14,
              ),
            ),
            HeaderTextField(
                hint: AppStrings.enterPhoneNumber,
                header: AppStrings.phoneNumber,
                controller: mobileController,
                icon: AppSvg.mobile),
            AppButton(title: AppStrings.getOtp,onTap: () {
              _showOTPSheet();
            },)
          ],
        ));
  }
  void _showOTPSheet() {
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                AppStrings.enterCode,
                style: AppStyle.black30W700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.weSentSMS,
                      style: AppStyle.grey14,
                    ),
                    TextSpan(
                      text: "+91 9112547856",
                      style: AppStyle.black14.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            OtpTextField(
              numberOfFields: 4,
              handleControllers: (controllers) {

              },
              borderColor: AppColors.colorPrimary,
              showFieldAsBox: true,
              enabledBorderColor: AppColors.colorPrimary,borderWidth: 1,
              textStyle: AppStyle.black20,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 65,
              borderRadius: BorderRadius.circular(15),
              fillColor: AppColors.white,
              filled: true,
              cursorColor: AppColors.colorPrimary,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode){

              }, // end onSubmit
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20,top: 14,right: 16),
                child: Text(
                  AppStrings.resentOTP,
                  style: AppStyle.black12.copyWith(color: AppColors.colorPrimary),
                ),
              ),
            ),
            AppButton(title: AppStrings.verify,onTap: () {
                context.push(BaseScreen());
            },),
            InkWell(
              onTap: () => context.pop(),
              child: Padding(
                padding: const EdgeInsets.only(top: 15,left: 10,bottom: 5),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,size: 10,),
                    4.width,
                    Text(AppStrings.enteredWrongNumber,style: AppStyle.black12.copyWith(decoration: TextDecoration.underline),),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Future<void> onLoginTap() async {
    AppHelper.hideKeyboard();
    if (mobileController.text.isEmpty) {
      AppHelper.showImageToast(message: AppValidator.messageBuilder("email")!);
      mobileFocus.requestFocusDelayed();
    } else if (mobileController.validateEmailAddress()) {
      AppHelper.showImageToast(
        message: AppValidator.messageBuilder("Email Address",
            validationType: ErrorType.INVALID)!,
      );
      mobileFocus.requestFocusDelayed();
    } else if (passwordController.text.isEmpty) {
      AppHelper.showImageToast(
          message: AppValidator.messageBuilder("password")!);
      passwordFocus.requestFocusDelayed();
    } else if (passwordController.text.length < 8) {
      AppHelper.showImageToast(
          message: "Password must be at least 6 characters.");
      passwordFocus.requestFocusDelayed();
    } else {
      TextInput.finishAutofillContext();
      await Provider.of<AuthProvider>(context, listen: false).login(
          email: mobileController.text,
          password: passwordController.text,
          fromTouchId: false);
    }
  }

  Future<void> onTouchIDTap() async {
    AppHelper.hideKeyboard();
    var isBiometric = await preference.getBoolData(PreferenceKeys.isBiometric);
    if (isBiometric.isTrue) {
      var provider = await Provider.of<AuthProvider>(context, listen: false);
      print(provider.userModel?.email);
      print(provider.userModel?.password);
      await Provider.of<AuthProvider>(context, listen: false).login(
          email: provider.userModel!.email!,
          password: provider.userModel!.password!,
          fromTouchId: true);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            AppStrings.enableTouchId,
            style: AppStyle.black14,
          ),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: Text(AppStrings.ok))
          ],
        ),
      );
    }
  }
}
