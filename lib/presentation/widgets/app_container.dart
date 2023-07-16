import 'package:flutter/cupertino.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, this.maxWidth, required this.child}) : super(key: key);
  final double? maxWidth;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
            maxWidth: maxWidth ?? 500,
        minWidth: 200),
        child: child,
      ),
    );
  }
}
