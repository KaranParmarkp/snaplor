import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key, required this.title, required this.data});
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: title),
      body: SingleChildScrollView(
        child: Html(
          data: data,
        ),
      ),
    );
  }
}
