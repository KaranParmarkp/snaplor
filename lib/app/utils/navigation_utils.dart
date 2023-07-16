import 'package:flutter/cupertino.dart';

class NavigationUtils {

  static void navigateToScreen(BuildContext context,dynamic screen) {
    Navigator.push(context,CupertinoPageRoute(
      builder: (context) => screen,
    ));
  }

  static void navigateToScreenWithRoot(BuildContext context,Widget screen) {
    Navigator.of(context,rootNavigator: true).push(
        CupertinoPageRoute(
          builder: (context) => screen,
        ));
  }

  static void navigateToScreenWithoutRoot(BuildContext context,Widget screen) {
    Navigator.of(context,rootNavigator: false).push(
        CupertinoPageRoute(
          builder: (context) => screen,
        ));
  }

  static void replaceToScreen(BuildContext context,Widget screen) {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => screen,));
  }

  static void backToScreen(BuildContext context){
    Navigator.pop(context);
  }

  static void backToScreenWithResult(BuildContext context,dynamic data){
    Navigator.pop(context,data);
  }

}
