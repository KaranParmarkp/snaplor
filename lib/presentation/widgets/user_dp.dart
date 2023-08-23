import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import 'widgets.dart';

class UserDP extends StatelessWidget {
  const UserDP({super.key, this.radius=22, this.image});
  final double radius;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.colorPrimary,
      child: CircleNetworkImageAvatar(
          radius: radius-2,
          image:
          image
      //        ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
      ),
    );
  }
}
