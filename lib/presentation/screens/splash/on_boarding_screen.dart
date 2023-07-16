import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';

import '../../widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.height,

                  Expanded(child: Center(child: AppLogo(whiteLogo: true,padding: 25,))),
                  
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        AppStrings.newToQuinable,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.hintGrey,
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    title: AppStrings.signUp,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16,top: 16),
                      child: Text(
                        AppStrings.haveAnAccount,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.hintGrey,
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    onTap: () => context.push(LoginScreen()),
                    title: AppStrings.login,outlineColor: AppColors.colorPrimary,buttonTextColor: AppColors.colorPrimary,
                  ),
                  30.height,



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
