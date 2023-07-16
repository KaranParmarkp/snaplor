import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';
import 'package:jyotishee/presentation/widgets/app_textfield.dart';
import 'package:jyotishee/presentation/widgets/half_gradient_container.dart';

import '../../../../data/providers/providers.dart';
import '../register/register_mobile_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mobileFocus = FocusNode();
  final passwordFocus = FocusNode();
  final codeFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  bool checkVerification = false;
  Timer? timer;
  int timerSeconds = 60;
  bool isTimerRunning = false;


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HalfGradientContainer(
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextField(hintText: AppStrings.newPassword,obscureText: true,controller: passwordController,focusNode: passwordFocus,),
          AppTextField(hintText: AppStrings.confirmNewPassword,obscureText: true,controller: confirmPasswordController,focusNode: confirmPasswordFocus,),
          55.height,
          AppButton(
            title: AppStrings.submit,
            onTap: () => _onSubmitTap(context),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: InkWell(
                onTap: () => context.push(RegisterMobileScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.hintGrey,
                      ),
                    ),
                    5.width,
                    Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.colorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      overlayWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 40),
            child: Text(
              AppStrings.forgotPassword,
              style: TextStyle(
                fontSize: 30,
                color: AppColors.white,
              ),
            ),
          ),

          AppTextField(
            hintText: AppStrings.mobile,
            controller: mobileController,
            focusNode: mobileFocus,
            maxLength: 10,
            keyboard: TextInputType.number,suffixIcon: InkWell(
            onTap: () =>  isTimerRunning ? null : _onVerificationTap(),
            child: Container(
              width: 100,
              margin: EdgeInsets.all(11),
              decoration: AppDecoration.skyBlueRounded
                  .copyWith(color:isTimerRunning ? AppColors.white : AppColors.colorPrimary.withOpacity(0.2),border: Border.all(color: isTimerRunning ? AppColors.colorPrimary : Colors.transparent)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(
                  isTimerRunning ? '${timerSeconds}S' : AppStrings.verification,
                  style: TextStyle(color: AppColors.colorPrimary,fontSize: 14),)),
              ),
            ),
          ),
          ),
          AppTextField(hintText: AppStrings.verificationCode,keyboard: TextInputType.number,controller: codeController,focusNode: codeFocus,),
          
        ],
      ),
    );
  }

  Future<void> _onVerificationTap() async {
    AppHelper.hideKeyboard();
    if(mobileController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Mobile")!);
      mobileFocus.requestFocusDelayed();
    }
    else if(mobileController.validatePhoneMaxDigit()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Mobile",
          validationType: ErrorType.INVALID)!,);
      mobileFocus.requestFocusDelayed();
    }
    else{
      var response = await Provider.of<AuthProvider>(context, listen: false).sendVerification(
        mobile : mobileController.text,fromForgot: true
      );
      if(response.isTrue) {
        checkVerification = true;
        startTimer();
        setState(() {

        });
      }
    }
  }

  void startTimer() {
    if (!isTimerRunning) {
      isTimerRunning = true;
      timerSeconds = 60;
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (timerSeconds > 0) {
          setState(() {
            timerSeconds--;
          });
        } else {
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
    isTimerRunning = false;
    setState(() {});
  }

  Future<void> _onSubmitTap(BuildContext context) async {
    AppHelper.hideKeyboard();
    if(mobileController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("mobile")!);
      mobileFocus.requestFocusDelayed();
    }
    else if(mobileController.validatePhone()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("mobile",
          validationType: ErrorType.INVALID)!,);
      mobileFocus.requestFocusDelayed();
    }
    else if(codeController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("verification code")!);
      codeFocus.requestFocusDelayed();
    }
    else if(passwordController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("password")!);
      passwordFocus.requestFocusDelayed();
    }else if(passwordController.text.length < 6){
      AppHelper.showImageToast(message: "Password must be at least 8 characters.");
      passwordFocus.requestFocusDelayed();
    }else if(confirmPasswordController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("confirm password")!);
      confirmPasswordFocus.requestFocusDelayed();
    }else if(passwordController.text!=confirmPasswordController.text){
      AppHelper.showImageToast(message: "Password and confirm password does not match");
      confirmPasswordFocus.requestFocusDelayed();
    }
    else{
      await Provider.of<AuthProvider>(context, listen: false).forgotPassword(
        mobile : mobileController.text,
        password: passwordController.text,
        code: codeController.text
      );
    }
  }
}
