import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jyotishee/app/utils/utils.dart';
class AppTextField extends StatefulWidget {
  AppTextField({
    required this.hintText,
    this.controller,
    this.focusNode ,
    this.borderColor,
    this.maxLines,
    this.margin,
    this.keyboard,
    this.obscureText,
    this.maxLength,
    this.formatter,
    this.counterText,
    super.key, this.enable,
    this.suffixIcon, this.onFieldSubmitted, this.autofillHints
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? borderColor;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final bool? enable;
  final TextInputType? keyboard;
  final bool? obscureText;
  final int? maxLength;
  final String? counterText;
  final List<TextInputFormatter>? formatter;
  final Widget? suffixIcon;
  final Function(String value)? onFieldSubmitted;
  final Iterable<String>? autofillHints;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool? obscureText;
  FocusNode? focusNode;
  Color textColor = AppColors.hintGrey;
  Color hintColor = AppColors.hintGrey;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    focusNode = widget.focusNode ?? FocusNode();
   }
  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: 500
      ),
      padding: widget.margin ?? EdgeInsets.only(bottom: 16),
      child: Focus(
        onFocusChange: (value) {
          if(value){
            textColor = AppColors.colorPrimary;
            hintColor = AppColors.colorPrimary;
          }else{
            textColor = AppColors.black;
            hintColor = AppColors.hintGrey;
          }
          setState(() {

          });
        },
        child: TextFormField(
          controller: widget.controller,
          focusNode: focusNode,
          cursorColor: AppColors.colorPrimary,
          enabled: widget.enable,
          keyboardType: widget.keyboard,
          maxLength: widget.maxLength,
          obscureText: obscureText?? false,
          obscuringCharacter: '●',
          autofillHints: widget.autofillHints,
          onFieldSubmitted: widget.onFieldSubmitted,
          style: TextStyle(
              color: textColor,
              fontSize: 16,
              ),
          maxLines: widget.maxLines ?? 1,
          decoration: InputDecoration(
              counterText: widget.counterText??"",
              contentPadding: EdgeInsets.only(top: 16,bottom: 16,left: 40,right: 16),
              border: InputBorder.none,
              hintText: widget.hintText,fillColor: AppColors.white,filled: true,
              hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: 16,
                  ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: AppColors.colorPrimary,width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color:widget.borderColor?? AppColors.hintGrey,width: 1),
              ),
            suffixIcon: obscureText!=null ? Container(
              width: 50,
              margin: EdgeInsets.only(left: 6),
              child: Padding(
                padding: const EdgeInsets.only(right: 22,top: 14,bottom: 14,left: 2),
                child: InkWell(
                  onTap: () {
                    obscureText = !obscureText!;
                    setState(() {

                    });
                  },
                  child: SizedBox(
                      height: 0,width: 0,
                      child: Image.asset(!obscureText! ? AppImages.showPass : AppImages.hidePass,)),
                ),
              ),
            ) : widget.suffixIcon

          ),
        ),
      ),
    );
  }
}
class HeaderTextField extends StatelessWidget {
  HeaderTextField({
    required this.hint,
    this.controller,
    this.focusNode ,
    this.borderColor,
    this.hintTextColor,
    this.maxLines,
    this.margin,
    this.keyboard,
    this.obscureText,
    this.maxLength,
    this.formatter,
    this.counterText,
    super.key, this.enable,
     this.header,this.showAsterisk=false,this.showArrow=false,this.onTap,this.headerColor=Colors.black,this.borderRadius=40
  });

  final String hint;
  final String? header;
  final bool showAsterisk;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? hintTextColor;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final bool? enable;
  final TextInputType? keyboard;
  final bool? obscureText;
  final int? maxLength;
  final String? counterText;
  final List<TextInputFormatter>? formatter;
  final bool showArrow;
  final VoidCallback? onTap;
  final Color headerColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: 500
      ),
      padding: EdgeInsets.only(bottom: 15,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(header!=null)Padding(
            padding: const EdgeInsets.only(bottom: 16,top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header!,style: AppStyle.black16.copyWith(color: headerColor),),
                if(showAsterisk)Text(" \*",style: TextStyle(color: AppColors.redFF0000),),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              child: Theme(
                data: ThemeData(
                  disabledColor: enable.isFalse && controller!.text.isNotEmpty? AppColors.black : AppColors.hintGrey,
                ),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  cursorColor: AppColors.colorPrimary,
                  enabled: enable,
                  keyboardType: keyboard,
                  maxLength: maxLength,
                  obscureText: obscureText?? false,
                  obscuringCharacter: '●',
                  style: TextStyle(
                      //color: AppColors.hintGrey,
                      //overflow: enable.isFalse ? TextOverflow.fade : null,
                      fontSize: 16,
                      ),
                  maxLines: maxLines ?? 1,
                  decoration: InputDecoration(
                      counterText: counterText??"",
                      contentPadding: EdgeInsets.only(top: 16,bottom: 16,left: 40,right: 16),
                      border: InputBorder.none,
                      hintText: hint,
                      fillColor: AppColors.greyF5F5F5,
                      filled: true,
                      hintStyle: TextStyle(
                          color: hintTextColor ?? AppColors.hintGrey,
                          fontSize: 16,
                          ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(color: AppColors.greyF5F5F5,width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(color:borderColor?? AppColors.greyF5F5F5,width: 1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(color:borderColor?? AppColors.greyF5F5F5,width: 1),
                      ),
                      suffixIcon: Icon(Icons.arrow_forward_ios_rounded,color: showArrow ? AppColors.hintGrey : Colors.transparent,)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MultipleLineTextField extends StatelessWidget {
  const MultipleLineTextField({super.key, required this.controller, required this.focusNode,  this.maxLines=3, this.hint, this.radius, this.keyboardType});
  final TextEditingController controller;
  final FocusNode focusNode;
  final int maxLines;
  final String? hint;
  final double? radius;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: Colors.black,
      controller: controller,
      focusNode: focusNode,
      style: AppStyle.black14,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        border: InputBorder.none,

        hintText: hint,
        fillColor: AppColors.greyF5F5F5,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ??10),
          borderSide:
          BorderSide(color: AppColors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ??10),
          borderSide:
          BorderSide(color: AppColors.transparent, width: 1),
        ),
      ),
    );
  }
}

