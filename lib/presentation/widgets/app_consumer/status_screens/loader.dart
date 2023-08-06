import 'package:flutter/material.dart';

import '../../../../app/utils/utils.dart';
import '../../loader_ring.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            //color: AppColors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Positioned(

              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  "assets/images/app_logo1.jpeg",
                  fit: BoxFit.fitWidth,
                  height: 80,width: 80,alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                      child: SpinKitRing(
                        color: AppColors.colorPrimary,size: 100,lineWidth: 4,
                        //color: AppColors.containerOrangeBorder,
                      )),
                ))
          ],
        ));
  }
}
