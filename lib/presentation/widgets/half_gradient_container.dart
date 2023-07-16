import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../app/utils/utils.dart';

class HalfGradientContainer extends StatelessWidget {
  const HalfGradientContainer(
      {Key? key,
      required this.bottomWidget,
      this.overlayWidget,
      this.showBack = true})
      : super(key: key);
  final Widget bottomWidget;
  final Widget? overlayWidget;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white),
        child: Container(
          decoration: AppDecoration.splash,
          child: SafeArea(
            //bottom: false,
            child: Scaffold(
              //resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 335,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 295,
                            decoration: AppDecoration.splash,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (showBack)
                                  InkWell(
                                    onTap: () => context.pop(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(22),
                                      child: SvgPicture.asset(
                                        AppSvg.backArrow,
                                        theme: SvgTheme(
                                          currentColor: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 38),
                                child: overlayWidget),
                          ),
                        ],
                      ),
                    ),
                    AppContainer(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 38, right: 38, bottom: 38),
                        child: bottomWidget,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
