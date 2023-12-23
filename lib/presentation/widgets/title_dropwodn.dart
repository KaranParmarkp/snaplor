import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class TitleDropdown extends StatelessWidget {
  const TitleDropdown({super.key, required this.text,  this.icon, this.onTap, this.leadingIcon, this.fontColor, this.subWidget});
  final String text;
  final Widget? icon;
  final Widget? leadingIcon;
  final VoidCallback? onTap;
  final Color? fontColor;
  final Widget? subWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.whiteShadowRounded,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            leadingIcon??SizedBox.shrink(),
            10.width,
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text,style: AppStyle.black14.copyWith(color: fontColor ?? AppColors.black),),
                subWidget??SizedBox()
              ],
            )),
            icon??SizedBox.shrink()

          ],
        ),
      ),
    );
  }
}
class TitleDropdownFAQ extends StatefulWidget {
  const TitleDropdownFAQ({super.key, required this.text,required this.header});
  final String text;
  final String header;

  @override
  State<TitleDropdownFAQ> createState() => _TitleDropdownFAQState();
}

class _TitleDropdownFAQState extends State<TitleDropdownFAQ> {

  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              isOpened = !isOpened;
              setState(() {

              });
            },
            child: Container(
              decoration: AppDecoration.whiteShadowRounded,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Row(
                children: [
                  Expanded(child: Text(widget.header,style: AppStyle.black14.copyWith(color: AppColors.black),)),
                  Icon(isOpened ? Icons.keyboard_arrow_up_rounded: Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ),
          ),
          if(isOpened)Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            child: Text(widget.text,style: AppStyle.black14,),
          ),
        ],
      ),
    );
  }
}