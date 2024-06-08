import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/error_screen.dart';

class CheckNetWidget extends StatefulWidget {
  const CheckNetWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _CheckNetWidgetState createState() => _CheckNetWidgetState();
}

class _CheckNetWidgetState extends State<CheckNetWidget> {
  late Connectivity _connectivity;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: _connectivity.onConnectivityChanged,
      builder: (context, snapshot) {
        print("base ${snapshot.connectionState}");
        if (snapshot.data == ConnectivityResult.none) {
          return ErrorScreen(error: "No Internet");
        }
        return widget.child;
      },
    );
  }
}



class InternetCheckerWidget extends StatefulWidget {
  const InternetCheckerWidget({super.key, required this.child});
  final Widget child;

  @override
  State<InternetCheckerWidget> createState() => _InternetCheckerWidgetState();
}

class _InternetCheckerWidgetState extends State<InternetCheckerWidget> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityBuilder(
      builder: (ConnectivityStatus status) {
        if (status == ConnectivityStatus.offline) {
          return ErrorScreen(error: "No Internet");
        }
        return widget.child;
      },
    );
  }
}
