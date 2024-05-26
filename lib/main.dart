import 'dart:developer';
import 'dart:ui';

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
    print(message.notification?.toMap().toString());
    RemoteNotification? notification = message.notification;
    //print(notification!.body?.contains("messaged you"));
    if (notification != null && notification.body!.contains("messaged you")!=true) {
      print("showing notification");
      /*localNotification.showSimpleNotification(
          title: notification.title.toString(),
          body: notification.body.toString());*/
    }
    else{
      print("not showing notification");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snaplor',
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navKey,
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
      supportedLocales: context.watch<AppProvider>().localeList,
      locale: context.watch<AppProvider>().currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        indicatorColor: AppColors.colorPrimary,
        useMaterial3: false
        //scaffoldBackgroundColor: Colors.white,
      ),
      home:  SplashScreen(),
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


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hey"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Align(

              child: Container(
                color: Colors.red, // Background color
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "itemText",
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}