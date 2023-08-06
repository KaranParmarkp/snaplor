import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import '../../../../app/utils/preferences/preferences.dart';
import '../../../../main.dart';
import '../../../widgets/widgets.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final mobileFocus = FocusNode();

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
            AppButton(title: AppStrings.getOtp,onTap: () => _getOtpTap(),)
          ],
        ));
  }
  void _showOTPSheet() {
    String otp = "";
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
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
                          text: "+91 ${mobileController.text}",
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
                    otp = code;
                    setState(() {

                    },);
                  },
                  onSubmit: (String verificationCode){
                    otp = verificationCode;
                    setState(() {

                    },);
                  }, // end onSubmit
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                       Provider.of<AuthProvider>(context, listen: false).login(
                        phone: mobileController.text,);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20,top: 14,right: 16),
                      child: Text(
                        AppStrings.resentOTP,
                        style: AppStyle.black12.copyWith(color: AppColors.colorPrimary),
                      ),
                    ),
                  ),
                ),
                AppButton(title: AppStrings.verify,onTap: () async {
                  if(otp.isEmpty || otp.length<4){
                    AppHelper.showToast(message: AppValidator.messageBuilder("OTP")!);
                  }  else{
                     Provider.of<AuthProvider>(context, listen: false).verificationVerify(
                      mobile: mobileController.text,
                    code: otp
                    );
                  }
                  //context.push(BaseScreen());
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
            );
          }
        ));
  }

  Future<void> _getOtpTap() async {
    AppHelper.hideKeyboard();
    if (mobileController.text.isEmpty) {
      AppHelper.showToast(message: AppValidator.messageBuilder("mobile")!);
      mobileFocus.requestFocusDelayed();
    } else if (mobileController.validatePhoneMaxDigit()) {
      AppHelper.showToast(
        message: AppValidator.messageBuilder("mobile",
            validationType: ErrorType.INVALID)!,
      );
      mobileFocus.requestFocusDelayed();
    }else {
      bool? response = await Provider.of<AuthProvider>(context, listen: false).login(
          phone: mobileController.text,);
      if(response.isTrue)_showOTPSheet();
    }
  }


}
