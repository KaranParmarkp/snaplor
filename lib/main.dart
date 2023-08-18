import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jyotishee/app/utils/preferences/preferences.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app/utils/utils.dart';

Preference preference = Preference();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent, // status bar color
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await preference.load();
  runApp(buildProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // navKey use to access context
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static BuildContext get appContext => navKey.currentState!.context;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jyotishee',
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      builder: EasyLoading.init(),
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
        physics: BouncingScrollPhysics(),
        scrollbars: true,
      ),
      supportedLocales: L10n.all,
      //locale: stateLocale.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        //scaffoldBackgroundColor: Colors.white,
      ),
      home: const BaseScreen(),
    );
  }
}

buildProviders() {
  return MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: SocialProvider()),
  ], child: const MyApp());
}


