import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';

import '../../../widgets/widgets.dart';

class RegisterSuccessfully extends StatelessWidget {
  const RegisterSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.company,onBackTap: context.pushReplace(LoginScreen())),
      body: SizedBox(
        height: context.screenHeight,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image.asset(AppImages.registerSuccess,height: 120,width: 140,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(AppStrings.registerSuccessfully,style: AppStyle.blackBold24,),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 90),
                     child: Text(AppStrings.yourAccountSuccessfully,style: AppStyle.black14,textAlign: TextAlign.center,),
                   ),
                  AppButton(title: AppStrings.finish,onTap: () => context.pushReplace(LoginScreen()),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
