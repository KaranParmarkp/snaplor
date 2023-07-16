import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../app/utils/utils.dart';
import '../screens/base/base_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key, required this.title, this.onBackTap,this.trailingIcon,  this.gradient=false}) : super(key: key);
  final String title;
  final VoidCallback? onBackTap;
  final Widget? trailingIcon;
  final bool gradient;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: AppStyle.black22.copyWith(color: gradient ? AppColors.white : AppColors.black),),
      centerTitle: true,
      backgroundColor:  Colors.white,
      automaticallyImplyLeading: false,
      elevation: 2,
      actions: [
        trailingIcon ?? SizedBox(),
        20.width,
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: gradient ? Brightness.light : Brightness.dark,
        statusBarBrightness: gradient ? Brightness.dark:Brightness.light
      ),
      flexibleSpace: Container(
        decoration: gradient ? AppDecoration.splash : BoxDecoration(),
      ),
      leading: InkWell(
        onTap: () => onBackTap ?? context.pop(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgImage(image :AppSvg.backArrow,color: gradient ? AppColors.white : AppColors.black,width: 14,height: 8),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity,60);
}
class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DashboardAppBar({Key? key, required this.title, this.trailingIcon}) : super(key: key);
  final String title;
  final Widget? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
  builder: (context, provider, child) {
  return AppBar(
      title: Text(title,style: TextStyle(fontSize: 22,color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        trailingIcon ?? SizedBox(),
        20.width,
      ],
      flexibleSpace: Container(
        decoration: AppDecoration.splash,
      ),
      leading: InkWell(
        onTap: () => scaffoldKey.currentState?.openDrawer(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(AppSvg.drawer,width: 25,height: 20),
        ),
      ),
    );
  },
);
  }

  @override
  Size get preferredSize => Size(double.infinity,60);
}
