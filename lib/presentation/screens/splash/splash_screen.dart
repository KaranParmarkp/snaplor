import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';

import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => _navigate(),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColors.colorPrimary,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding:  EdgeInsets.symmetric(horizontal: 65),
          child: Image.asset(AppImages.appLogo),
        ),
      )

    ;
  }

  _navigate() {
    var authenticationProvider = Provider.of<AuthProvider>(context,listen: false);
    if(authenticationProvider.authStatus == AuthStatus.authenticated && authenticationProvider.userModel?.accessToken != null){
      context.pushReplace(BaseScreen());
    } else{
      context.pushReplace(LoginScreen());
    }
  }
}
