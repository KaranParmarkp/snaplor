import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:jyotishee/app/utils/preferences/preferences.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/main.dart';
import 'package:jyotishee/presentation/screens/provider/suspended_providers_screen.dart';
import 'package:jyotishee/presentation/widgets/app_webview_screen.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/setting_card.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PackageInfo? packageInfo;
  final LocalAuthentication auth = LocalAuthentication();
  late bool canAuthenticateWithBiometrics;
  late bool canAuthenticate;
  bool touchId = false;
  void initState() {
    super.initState();
    init();
    //initPlatformState();
  }

  init() async {
    packageInfo = await PackageInfo.fromPlatform();
    canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    getTouchId();
  }

  getTouchId() async {
    touchId = await preference.getBoolData(PreferenceKeys.isBiometric) ?? false;
    if(mounted) setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.settings),
      body: Column(
        children: [
          SettingItem(title: AppStrings.suspendedList,onTap: () => context.push(SuspendedProvidersScreen()),),
          SettingItem(
            title: AppStrings.aboutUs,
            onTap: () => context.push(AppWebViewScreen(title: AppStrings.aboutUs,url: ApiConfig.aboutUs,)),
          ),
          SettingItem(
            title: AppStrings.appVersion,
            widget: Text(packageInfo?.version ?? ''),
          ),
          SettingItem(
            title: AppStrings.touchId,onTap: () => _authenticate(!touchId),
            widget: SizedBox(
              height: 0,
              child: CupertinoSwitch(
                value: touchId,
                onChanged: (bool value) {
                  //_authenticate(!touchId);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _authenticate(bool value) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Confirm your fingerprint to authenticate',
          /*authMessages: <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: "Touch ID for \"Facility App-Staging\" ",
              biometricHint: "Confirm your fingerprint to authenticate.",
              cancelButton: 'Cancel',
            ),
            IOSAuthMessages(
              cancelButton: 'Cancel',
            ),
          ],*/
      options: AuthenticationOptions(biometricOnly: true)
      );
      print(didAuthenticate);
      if(didAuthenticate)await preference.setBool(PreferenceKeys.isBiometric, value);
      getTouchId();

    } on PlatformException catch(e){
      print(e);

    }
  }

}
