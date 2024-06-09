import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/error_screen.dart';



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
class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    if (!_controller.isClosed) {
      _controller.sink.add({result: isOnline});
    }
  }

  void disposeStream() => _controller.close();
}


class InternetScreen extends StatefulWidget {
  final Widget child;
  const InternetScreen({super.key, required this.child});
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    MyConnectivity.instance.initialise();
    MyConnectivity.instance.myStream.listen((event) {
      setState(() {
        _isConnected = event.values.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? widget.child : ErrorScreen(error: "No Internet");
  }

  @override
  void dispose() {
    MyConnectivity.instance.disposeStream();
    super.dispose();
  }
}
