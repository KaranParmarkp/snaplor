import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/auth/register/select_company_screen.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';
import 'package:jyotishee/presentation/widgets/app_textfield.dart';
import 'package:jyotishee/presentation/widgets/half_gradient_container.dart';

import '../../../../data/providers/providers.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key, required this.mobile}) : super(key: key);
  final String mobile;
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return HalfGradientContainer(
      showBack: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextField(
            hintText: AppStrings.confirmPassword,
            obscureText: true,
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocus,
          ),
          AppTextField(
            hintText: AppStrings.firstName,
            controller: firstNameController,
            focusNode: firstNameFocus,
          ),
          AppTextField(
            hintText: AppStrings.lastName,
            controller: lastNameController,
            focusNode: lastNameFocus,
          ),
          40.height,
          AppButton(
            title: AppStrings.next,
            onTap: () => _onNextTap(),
          ),
        ],
      ),
      overlayWidget: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 12),
            child: Text(
              AppStrings.createAcc,
              style: TextStyle(
                fontSize: 26,
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Text(
              AppStrings.fillBasicInfo,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
          ),
          AppTextField(
            hintText: AppStrings.email,
            keyboard: TextInputType.emailAddress,
            controller: emailController,
            focusNode: emailFocus,
          ),
          AppTextField(
            hintText: AppStrings.password,
            obscureText: true,
            controller: passwordController,
            focusNode: passwordFocus,
          ),

        ],
      ),
    );
  }
  Future<void> _onNextTap() async {
    AppHelper.hideKeyboard();
    if(emailController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Email")!);
      emailFocus.requestFocusDelayed();
    }
    else if(emailController.validateEmailAddress()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Email",
          validationType: ErrorType.INVALID)!,);
      emailFocus.requestFocusDelayed();
    }else if(passwordController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("Password")!);
      passwordFocus.requestFocusDelayed();
    }else if(passwordController.text.length < 8){
      AppHelper.showImageToast(message: "Password must be at least 8 characters.");
      passwordFocus.requestFocusDelayed();
    }else if(confirmPasswordController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("confirm password")!);
      confirmPasswordFocus.requestFocusDelayed();
    }else if(passwordController.text!=confirmPasswordController.text){
      AppHelper.showImageToast(message: "Password and confirm password does not match");
      confirmPasswordFocus.requestFocusDelayed();
    }else if(firstNameController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("First Name")!);
      firstNameFocus.requestFocusDelayed();
    }
    else{
      RegisterModel model = RegisterModel(
        first_name: firstNameController.text,
        last_name: lastNameController.text,
        password: passwordController.text,
        confirm_new_password: confirmPasswordController.text,
        email: emailController.text.trim().toLowerCase(),
        mobile: widget.mobile
      );
      var response = await Provider.of<AuthProvider>(context, listen: false).checkEmailOrMobile(
          email : emailController.text.trim().toLowerCase(),
      );
      if(response.isTrue)context.push(SelectCompanyScreen(model: model));
    }
  }
}
