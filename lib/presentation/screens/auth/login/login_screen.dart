import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/auth/register/register_mobile_screen.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopExit(
      child: HalfGradientContainer(
        showBack: false,
        bottomWidget: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              hintText: AppStrings.password,
              obscureText: true,
              controller: passwordController,
              focusNode: passwordFocus,
              autofillHints: [
                AutofillHints.password
              ],

            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => context.push(ForgotPasswordScreen()),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 44),
                  child: Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
              ),
            ),
            AppButton(
              title: AppStrings.login,
              onTap: () => onLoginTap(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      height: 1,
                      color: AppColors.hintGrey.withOpacity(0.5),
                    )),
                    6.width,
                    Text(
                      AppStrings.orUseTouchId,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.hintGrey,
                      ),
                    ),
                    6.width,
                    Expanded(
                        child: Divider(
                      height: 1,
                      color: AppColors.hintGrey.withOpacity(0.5),
                    )),
                  ],
                ),
              ),
            ),
            Center(
                child: InkWell(
              onTap: () => onTouchIDTap(),
              child: Image.asset(
                AppImages.fingerprint,
                height: 66,
                width: 66,
                fit: BoxFit.cover,
              ),
            )),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => context.push(RegisterMobileScreen()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
            AppLogo(
              padding: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 60),
              child: Text(
                AppStrings.loginTojyotishee,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ),
            AppTextField(
              hintText: AppStrings.emailMobileNumber,
              autofillHints: [
                AutofillHints.email
              ],
              controller: emailController,
              focusNode: emailFocus,
              keyboard: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onLoginTap() async {
    AppHelper.hideKeyboard();
    if (emailController.text.isEmpty) {
      AppHelper.showImageToast(message: AppValidator.messageBuilder("email")!);
      emailFocus.requestFocusDelayed();
    } else if (emailController.validateEmailAddress()) {
      AppHelper.showImageToast(
        message: AppValidator.messageBuilder("Email Address",
            validationType: ErrorType.INVALID)!,
      );
      emailFocus.requestFocusDelayed();
    } else if (passwordController.text.isEmpty) {
      AppHelper.showImageToast(message: AppValidator.messageBuilder("password")!);
      passwordFocus.requestFocusDelayed();
    } else if (passwordController.text.length < 8) {
      AppHelper.showImageToast(
          message: "Password must be at least 6 characters.");
      passwordFocus.requestFocusDelayed();
    } else {
      TextInput.finishAutofillContext();
      await Provider.of<AuthProvider>(context, listen: false).login(
          email: emailController.text,
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
