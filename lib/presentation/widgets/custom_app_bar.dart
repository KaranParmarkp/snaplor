import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/notification/notification_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/profile_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../app/utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.onBackTap,this.gradient=false,
      this.trailingIcon,
      this.showProfile = false,  this.showNotification=false,  this.showBack=true})
      : super(key: key);
  final String title;
  final VoidCallback? onBackTap;
  final Widget? trailingIcon;
  final bool showProfile;
  final bool showNotification;
  final bool showBack;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
  builder: (context, provider, child) {
  return AppBar(
      title: Text(
        title, style: AppStyle.black16.copyWith(fontWeight: FontWeight.w500),
      ),
      //centerTitle: true,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 8,
      shadowColor: AppColors.shadowAppBar,
      actions: [
        trailingIcon ?? SizedBox(),
        if(showNotification)InkWell(
          onTap: () => context.push(NotificationScreen()),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgImage(image: AppSvg.bell,),
                Positioned(
                    right: 0,
                    top: 8,
                    child: CircleAvatar(radius: 4,backgroundColor: AppColors.colorPrimary,))
              ],
            ),
          ),
        ),
        if(showProfile)InkWell(
          onTap: () => context.push(ProfileScreen()),
          child: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: CircleNetworkImageAvatar(
                radius: 20,
                image: provider.userModel!.profileImage),
          ),
        ),
        10.width
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:  Brightness.dark,
          statusBarBrightness:  Brightness.light),
      leading: showBack ? InkWell(
        onTap: () => onBackTap ?? context.pop(),
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgImage(
                image: AppSvg.back,
                color:  AppColors.black,
                width: 14,
                height: 8),
          ),
        ),
      ) : SizedBox(),
    );
  },
);
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key, this.title, this.trailingIcon})
      : super(key: key);
  final String? title;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppProvider,AuthProvider>(
      builder: (context, provider,authProvider, child) {
        return AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${AppStrings.hi} ${authProvider.userModel?.name}", style: AppStyle.black14.copyWith(fontWeight: FontWeight.bold)),
              Text("${authProvider.userModel?.email}", style: AppStyle.grey12),
            ],
          ),
          centerTitle: false,
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          elevation: 8,
          shadowColor: AppColors.shadowAppBar,
          actions: [
            InkWell(
              onTap: () => context.push(NotificationScreen()),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgImage(image: AppSvg.bell,),
                    Positioned(
                        right: 0,
                        top: 8,
                        child: CircleAvatar(radius: 4,backgroundColor: AppColors.colorPrimary,))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => context.push(ProfileScreen()),
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 10),
                child: CircleNetworkImageAvatar(
                radius: 20,
                    image: authProvider.userModel?.profileImage),
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 65);
}
