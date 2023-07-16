import 'package:flutter/material.dart';

import '../../app/utils/app_helper.dart';

class DismissKeyBoard extends StatelessWidget {
  const DismissKeyBoard({Key? key,required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      focusColor: Colors.transparent,
      onTap: () => AppHelper.hideKeyboard(),
      child: child,
    );
  }
}
