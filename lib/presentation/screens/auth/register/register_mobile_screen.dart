import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';
import 'package:jyotishee/presentation/widgets/app_logo.dart';
import 'package:jyotishee/presentation/widgets/app_textfield.dart';
import 'package:jyotishee/presentation/widgets/half_gradient_container.dart';
import '../../../../data/providers/providers.dart';

class RegisterMobileScreen extends StatefulWidget {
  const RegisterMobileScreen({Key? key}) : super(key: key);

  @override
  State<RegisterMobileScreen> createState() => _RegisterMobileScreenState();
}

class _RegisterMobileScreenState extends State<RegisterMobileScreen> {
  final mobileController = TextEditingController();
  final verificationCodeController = TextEditingController();
  final mobileFocus = FocusNode();
  final verificationCodeFocus = FocusNode();
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
      showBack: true,
      overlayWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogo(
            padding: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 60),
            child: Text(
              AppStrings.mobileNumber,
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

        ],
      ),
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextField(
            hintText: AppStrings.verificationCode,
            obscureText: true,
            controller: verificationCodeController,
            focusNode: verificationCodeFocus,
            keyboard: TextInputType.number,
          ),
          30.height,
          AppButton(
            title: AppStrings.next,
            onTap: () => _onNextTap()
          ),

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
      var response = await Provider.of<AuthProvider>(context, listen: false).checkEmailOrMobile(
          mobile : mobileController.text,
      );
      if(response.isTrue) {
        checkVerification = true;
        startTimer();
        setState(() {

        });
      }
    }
  }

  Future<void> _onNextTap() async {
    AppHelper.hideKeyboard();
    if(mobileController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Mobile")!);
      mobileFocus.requestFocusDelayed();
    }
    else if(mobileController.validatePhoneMaxDigit()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Mobile",
          validationType: ErrorType.INVALID)!,);
      mobileFocus.requestFocusDelayed();
    }else if(verificationCodeController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("verification code")!);
      verificationCodeFocus.requestFocusDelayed();
    }
    else{
      await Provider.of<AuthProvider>(context, listen: false).verificationVerify(
          mobile : mobileController.text,
          code: verificationCodeController.text
      );
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
}
