import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/home/home_screen.dart';
import 'package:jyotishee/presentation/screens/auth/forgot_password/forgot_screen.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import 'package:jyotishee/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:jyotishee/presentation/screens/drawer/app_drawer.dart';
import 'package:jyotishee/presentation/screens/provider/provider_screen.dart';

import '../../widgets/widgets.dart';

// below key is used to connect with side drawer from appbar
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> screens = [
    HomeScreen(),
    LoginScreen(),
    LoginScreen(),
    LoginScreen(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
          )
        ]),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: AppStyle.grey12,
          selectedLabelStyle: AppStyle.blue12,
          selectedItemColor: AppColors.colorPrimary,
          unselectedItemColor: AppColors.hintGrey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 12,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgImage(
                  image: AppSvg.home,
                  color: selectedIndex == 0
                      ? AppColors.colorPrimary
                      : AppColors.hintGrey,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgImage(
                      image: AppSvg.search,
                      color: selectedIndex == 1
                          ? AppColors.colorPrimary
                          : AppColors.hintGrey),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgImage(
                      image: AppSvg.wallet,
                      color: selectedIndex == 2
                          ? AppColors.colorPrimary
                          : AppColors.hintGrey),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgImage(
                      image: AppSvg.setting,
                      color: selectedIndex == 3
                          ? AppColors.colorPrimary
                          : AppColors.hintGrey),
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
