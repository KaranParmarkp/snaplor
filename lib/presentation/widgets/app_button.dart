import 'package:flutter/material.dart';
import '../../app/utils/utils.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      this.borderRadius,
      this.padding,
      this.onTap,
      required this.title,
      this.textStyle,
      this.bgColor,
      this.margin,
      this.width,
      this.buttonTextColor,
      this.textFontSize,
      this.fontFamily,
      this.outlineColor})
      : super(key: key);
  final void Function()? onTap;
  final String title;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? buttonTextColor;
  final EdgeInsets? margin;
  final double? textFontSize;
  final double? width;
  final String? fontFamily;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: width  ??  double.infinity,
          constraints: BoxConstraints(
            maxWidth: 500
          ),
          decoration: outlineColor!=null ? BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(30),
            border: Border.all(color: outlineColor!,width: 1)
          ): BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(30),
              gradient: AppColors.appGradient,
              boxShadow: [
               /* BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 1.5)*/
                BoxShadow(
                  blurRadius: 13,
                  color: AppColors.shadowColor,
                  offset: Offset(0, 7),
                )
              ]),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              title,
              style: textStyle ??
                  TextStyle(
                      color: buttonTextColor ?? AppColors.white,
                      fontSize: textFontSize ?? 20,
                      fontWeight: FontWeight.bold,),
            ),
          )),
        ),
      ),
    );
  }
}

class SquareGradientButton extends StatelessWidget {
  const SquareGradientButton({
    super.key, required this.title, this.onTap,this.disable=false
  });
  final String title;
  final VoidCallback? onTap;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: disable ? BoxDecoration(color: AppColors.greyF5F5F5) : AppDecoration.splash,
        padding:
        EdgeInsets.only(top: 18, left: 16, right: 10, bottom: 16),
        child: Center(
            child: Text(
              title,
              style: AppStyle.whiteBold20.copyWith(color: disable ? AppColors.hintGrey : AppColors.white),
            )),
      ),
    );
  }
}

class LightRoundButton extends StatefulWidget {
  const LightRoundButton({Key? key, required this.title, this.onTap, this.margin, this.height, this.fontSize=18, this.padding}) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final double? height;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  State<LightRoundButton> createState() => _LightRoundButtonState();
}

class _LightRoundButtonState extends State<LightRoundButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHighlightChanged: (value) {
        setState(() {
          isButtonPressed = value;
        });
      },
      child: Container(
        height: widget.height,
        decoration: isButtonPressed ? AppDecoration.splash.copyWith(
          borderRadius: BorderRadius.circular(32),
        ): AppDecoration.skyBlueLightRounded.copyWith(
          borderRadius: BorderRadius.circular(32),
        ),
        margin: widget.margin ?? EdgeInsets.only(bottom: 20),
        child: Padding(
          padding:  widget.padding ?? EdgeInsets.all(16.0),
          child: Center(child: Text(widget.title,style: AppStyle.blue16.copyWith(fontSize: widget.fontSize, color: isButtonPressed ? AppColors.white : AppColors.colorPrimary),)),
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key, required this.title, this.color, this.onTap,
  });
  final String title;
  final Color? color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: color ?? AppColors.colorPrimary)
      ),
      child: InkWell(
          onTap: onTap,child: Center(child: Text(title,style: AppStyle.blue16Bold.copyWith(color: color ?? AppColors.colorPrimary),))),
    );
  }
}
class AppShadeButton extends StatelessWidget {
  const AppShadeButton({
    super.key, this.onTap, required this.text, required this.startColor, required this.endColor,  this.bold=false, this.padding,
  });
  final VoidCallback? onTap;
  final String text;
  final Color startColor;
  final Color endColor;
  final bool bold;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Container(
        padding:padding ??  EdgeInsets.symmetric(vertical: 12,horizontal: 10),
        decoration: AppDecoration.buttonGradient.copyWith(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 0),
            end: AlignmentDirectional(-1, 0),
          ),
        ),
        child: Center(child: Text(text,style: AppStyle.white16.copyWith(fontWeight: bold ? FontWeight.bold : FontWeight.w500),)),
      ),
    );
  }
}