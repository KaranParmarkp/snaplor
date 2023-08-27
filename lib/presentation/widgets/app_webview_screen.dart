import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widgets.dart';

class AppWebViewScreen extends StatefulWidget {
  const AppWebViewScreen({Key? key, required this.title, required this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  State<AppWebViewScreen> createState() => _AppWebViewScreenState();
}

class _AppWebViewScreenState extends State<AppWebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            /*if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }*/
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: SizedBox(
        height: context.screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10),
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
