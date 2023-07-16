import 'package:flutter/cupertino.dart';

import '../../app/utils/utils.dart';

class WillPopExit extends StatelessWidget {
  const WillPopExit({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async{
        AppHelper.showExitDialog(context);
        return false;
      },
    );
  }
}
