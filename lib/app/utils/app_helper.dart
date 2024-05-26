import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/ftoast.dart' as ft;
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../presentation/widgets/widgets.dart';

///AppHelper class contains function that will help in ui related code
class AppHelper {
  static BuildContext? dialogContext;



  static Future<void> showLoading() async {
    ///do not remove this await
    await EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.transparent
      ..textStyle = const TextStyle()
      ..textColor = Colors.white
      ..radius = 12.0
      ..contentPadding = EdgeInsets.zero
      ..maskType = EasyLoadingMaskType.black
      ..dismissOnTap = false;
    EasyLoading.show(
        dismissOnTap: false,
        indicator: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.white,
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
                      height: 80, width: 80, alignment: Alignment.center,
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
                        color: AppColors.colorPrimary,
                        size: 100,
                        lineWidth: 4,
                        //color: AppColors.containerOrangeBorder,
                      )),
                    ))
              ],
            )));
  }

  static hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }


  static void showToast(
      {BuildContext? context,
      required String message,
        Color? textColor,
      bool success = false,
      int duration = 1800}) {
    Platform.isMacOS ? ft.FToast.toast(
      context ?? MyApp.navKey.currentContext!,
      msg: message,
      msgStyle: AppStyle.whiteBold16,
      duration: duration,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      //imageDirection: AxisDirection.up,
    ):
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: AppColors.colorPrimary,
        textColor: textColor ?? Colors.white,
        fontSize: 14);
  }

  static showSnackBar(
      {required BuildContext context,
      required String message,
      bool? isSuccess}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: isSuccess != null
          ? isSuccess
              ? Colors.green
              : Colors.red
          : Colors.amber,
      elevation: 1.0,
    ));
  }

  static Future<File?> pickImage({required bool fromCamera}) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return image != null ? File(image.path) : null;
  }

  static Future<List<File>> pickMultipleImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? images = await imagePicker.pickMultiImage();

    List<File> files = [];
    if (images != null) {
      for (XFile image in images) {
        File file = File(image.path);
        files.add(file);
      }
    }

    return files;
  }

  static Future<File?> pickVideo({required bool fromCamera}) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? video = await imagePicker.pickVideo(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,);
    return video != null ? File(video.path) : null;
  }

  static Future<File?> pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if(result!=null && result.files.single.path!=null) {
      File file = File(result.files.single.path!);
      print(file.path);
      if(p.extension(file.path) == ".pdf" || p.extension(file.path) == ".doc"){
        return file;
      } else {
        AppHelper.showToast(message: "File Not allowed");
      }
    }
    return null;
  }
  static Future<bool> willPopScope() {
    if (Platform.isIOS) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
    return Future.value(true);
  }

  static showExitDialog(BuildContext context) {
    showCupertinoModalPopup<bool>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Center(
            child: Text(
              "Are you sure want to exit",
              style: TextStyle(
                  //     color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              if (Platform.isIOS) {
                SystemNavigator.pop();
              } else {
                SystemNavigator.pop();
                //exit(0);
              }
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static hideKeyboard() async {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showLogoutDialog(BuildContext context) {
    showCupertinoModalPopup<bool>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Center(
            child: Text(
              "Are you sure want to Logout?",
              style: TextStyle(
                  //     color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {},
            child: Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static datePicker(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  static Future<DateTime?> showDatePicker(
      {required BuildContext context,
      CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
      DateTime? minimumDate,
      DateTime? maximumDate,
        int? maximumYear}) async {
    DateTime? date =maximumDate;//= DateTime.now();
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateDialog) {
          return Container(
            height: 250,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                Container(
                  decoration: AppDecoration.splash,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          date = null;
                          setStateDialog(() {});
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                          child: Text(
                            "Cancel",
                            style: AppStyle.white16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setStateDialog(() {});
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                          child: Text(
                            "OK",
                            style: AppStyle.white16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    minimumDate: minimumDate,
                    maximumDate: maximumDate,
                    maximumYear: maximumYear,
                    mode: mode,
                    initialDateTime: maximumDate,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newDate) {
                      setStateDialog(() {
                        date = newDate;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
    print(date);
    return date != null ? date : null;
  }

  static showBottomSheet<T>(
      {required BuildContext context,
      required Widget child,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? innerPadding,
      bool isScrollControlled = false,
      bool isDismissible = false,
      bool showCloseIcon = true}) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      builder: (context) {
        return DismissKeyBoard(
          child: Padding(
            padding: isScrollControlled
                ? MediaQuery.of(context).viewInsets
                : EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0,right: 16),
                      child: CircleAvatar(
                        radius: 15,
                          backgroundColor: AppColors.white,
                          child: SvgImage(image: AppSvg.close,)),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22))),
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: innerPadding ?? EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [child],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static launchWebUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static launchSMS(String number) async {
    final uri = 'sms:$number';
    final Uri _url = Uri.parse(uri);
    if (!await launchUrl(
      _url,
    )) {
      throw 'Could not launch $_url';
    }
  }

  static launchCall(String number) async {
    final uri = 'tel:$number';
    final Uri _url = Uri.parse(uri);
    if (!await launchUrl(
      _url,
    )) {
      throw 'Could not launch $_url';
    }
  }

  static launchEmail(String email) async {
    final uri = 'mailto:$email';
    final Uri _url = Uri.parse(uri);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  static showHelpDialog(BuildContext context){
    return showDialog(context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.transparent,

        child: Container(
        padding: EdgeInsets.all(15),
        height: 100,
        decoration: AppDecoration.whiteShadowRounded,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,width: 60,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(right: 20),
              decoration: AppDecoration.purpleLightRounded.copyWith(
                borderRadius: BorderRadius.circular(8)
              ),
              child: SvgImage(image: AppSvg.callHelp),
            ),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("You need help?",style: AppStyle.black14w600,),
                5.height,
                Row(
                  children: [
                    Text("Call Us on:  ",style: AppStyle.hintGray12,),
                    InkWell(
                        onTap: () => AppHelper.launchCall("9818484869"),
                        child: Text("+91 9818484869",style: AppStyle.black12w600,)),
                  ],
                ),
              ],
            )),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)))
          ],
        ),
            ),
      ),);
  }

  static sharePost(String id){
    Share.share('https://snaplor.com/post/$id');
  }

  static showCustomDialog({required BuildContext context,required title,String? positiveText,String? negativeText,Function()? onPositiveTap,Function()? onNegativeTap,String? subText}){
    return showDialog(context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: AppColors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          //width: double.infinity,
          decoration: AppDecoration.whiteShadowRounded,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Text(title,style: AppStyle.black14w600,)),
              if(subText.isNotNull)...[10.height,
              Center(child: Text(subText!,style: AppStyle.black14,textAlign: TextAlign.center,)),],
              30.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: AppRoundedButton(text: positiveText ?? "Yes",onTap: onPositiveTap,color: AppColors.colorPrimary,)),
                  10.width,
                  Expanded(child: AppRoundedButton(text: positiveText ?? "No",onTap: onNegativeTap,color: AppColors.colorPrimary,))
                ],
              ),
            ],
          ),
        ),
      ),);
  }

}
