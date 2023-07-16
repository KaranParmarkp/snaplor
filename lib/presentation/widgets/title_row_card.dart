import 'package:flutter/widgets.dart';

import '../../app/utils/utils.dart';

class TitleRowCard extends StatelessWidget {
  const TitleRowCard({
    super.key,
    required this.title,
    required this.answer,
  });

  final String title;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyle.grey16,
          ),
          Expanded(
            child: Text(
              answer,
              style: AppStyle.black16,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}