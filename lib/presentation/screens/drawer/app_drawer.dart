import 'package:flutter/material.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/dashboard/approve_times/approve_times_screen.dart';
import 'package:jyotishee/presentation/screens/drawer/settings/settings_screen.dart';
import 'package:jyotishee/presentation/screens/drawer/support/support_screen.dart';
import 'package:jyotishee/presentation/screens/shift/shift_lists/shift_list_screen.dart';
import '../../../app/utils/utils.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.splash,
      child: SafeArea(
        bottom: false,
        child: Drawer(
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  // Circle avatar header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 22, bottom: 22, left: 26, right: 26),
                    decoration: AppDecoration.splash,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () => context.pop(),
                                child: SvgPicture.asset(AppSvg.close))),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CircleAvatar(
                            radius: 61,
                            backgroundColor: AppColors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.blueDcf2ff,
                              child: Center(
                                child: Text(
                                  provider.userModel!.firstName![0]+provider.userModel!.lastName![0],
                                  style: TextStyle(fontSize: 46),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            provider.userModel!.firstName! +" "+ provider.userModel!.lastName!,
                            style: AppStyle.whiteBold16.copyWith(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 6, top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 15,
                                  child: SvgPicture.asset(AppSvg.email)),
                              10.width,
                              Expanded(
                                  child: Text(
                                provider.userModel!.email!,
                                style: AppStyle.white14,
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 15,
                                  child: SvgPicture.asset(AppSvg.phone)),
                              10.width,
                              Expanded(
                                  child: Text(
                                    provider.userModel!.mobile!,
                                style: AppStyle.white12,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  DrawerItem(
                    icon: AppSvg.calender,
                    title: AppStrings.shiftList,
                    onTap: () {
                      context.pop();
                      context.push(ShiftListScreen(shiftType: ShiftsTypes
                          .shiftList));
                    },
                  ),
                  DrawerItem(
                    icon: AppSvg.time,
                    title: AppStrings.approveTimesDrawer,
                    onTap: () {
                      context.pop();
                      context.push(ApproveTimesScreen(fromDrawer: true,));
                    },
                  ),
                  DrawerItem(
                    icon: AppSvg.settings,
                    title: AppStrings.settings,
                    onTap: () {
                      context.pop();
                      context.push(SettingsScreen());
                    },
                  ),
                  DrawerItem(
                    icon: AppSvg.support,
                    title: AppStrings.support,
                    onTap: () {
                      context.pop();
                      context.push(SupportScreen());
                    },
                  ),

                  Spacer(),
                  Column(
                    children: [
                      Divider(
                        color: AppColors.hintGrey,
                      ),
                      InkWell(
                        onTap: () async => await Provider.of<AuthProvider>(
                                context,
                                listen: false)
                            .logout(),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                              child: Text(
                            AppStrings.logout,
                            style: AppStyle.blackBold26.copyWith(fontSize: 20),
                          )),
                        ),
                      ),
                      Divider(
                        color: AppColors.hintGrey,
                        height: 4,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20,
                  width: 20,
                ),
                10.width,
                Text(
                  title,
                  style: AppStyle.black16,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.hintGrey,
                )
              ],
            ),
            20.height,
            Divider(
              color: AppColors.hintGrey.withOpacity(0.5),
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
