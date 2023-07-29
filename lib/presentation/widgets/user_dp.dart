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
          image ?? "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
    );
  }
}
