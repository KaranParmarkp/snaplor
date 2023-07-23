import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/notification/notification_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../app/utils/utils.dart';
import '../screens/base/base_screen.dart';

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
          child: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: CircleNetworkImageAvatar(
                radius: 20,
                image:
                "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
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
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.hi + "Mudhusudhan!", style: AppStyle.black14.copyWith(fontWeight: FontWeight.bold)),
              Text("mudhusudhan07@gmail.com", style: AppStyle.grey12),
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
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 10),
                child: CircleNetworkImageAvatar(
                radius: 20,
                    image:
                        "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
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
