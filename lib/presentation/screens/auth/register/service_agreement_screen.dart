import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';

import '../../../widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceAgreementScreen extends StatefulWidget {
  const ServiceAgreementScreen({Key? key}) : super(key: key);

  @override
  State<ServiceAgreementScreen> createState() => _ServiceAgreementScreenState();
}

class _ServiceAgreementScreenState extends State<ServiceAgreementScreen> {
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
      ..loadRequest(Uri.parse(ApiConfig.serviceAgreementUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.serviceAgreement),
      body: SizedBox(
        height: context.screenHeight,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10),

              child: WebViewWidget(controller: controller),
            ) ),
            SquareGradientButton(
              title: AppStrings.reviewed,
              onTap: () {Navigator.pop(context,true);},
            ),
          ],
        ),
      ),
    );
  }
}
