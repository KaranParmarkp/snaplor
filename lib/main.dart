import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jyotishee/app/utils/preferences/preferences.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import 'package:jyotishee/presentation/screens/splash/splash_screen.dart';

import 'app/utils/utils.dart';
import 'firebase_options.dart';

Preference preference = Preference();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
LocalNotification localNotification = LocalNotification();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // navKey use to access context
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static BuildContext get appContext => navKey.currentState!.context;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if(!kIsWeb){
      FirebaseMessaging.instance
          .requestPermission(alert: true, announcement: true, sound: true);
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("not received");
        requestNotification(message);
      });

      getToken();
    }
  }

  getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    setState(() {});
    log(token.toString(), name: "FCM Token");
  }

  requestNotification(RemoteMessage message) {
    print("notification received");
    print(message.notification);
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null /*&& android != null*/) {
      localNotification.showSimpleNotification(
          title: notification.title.toString(),
          body: notification.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jyotishee',
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navKey,
      builder: EasyLoading.init(),
      scrollBehavior: MaterialScrollBehavior().copyWith(
        /*dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },*/
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


