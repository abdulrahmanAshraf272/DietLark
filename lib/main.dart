import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/screens/myDiet/my_diet_screen.dart';

import 'package:food_app/screens/food_categories/food_categories_screen.dart';
import 'package:food_app/screens/just_downloaded/welcome_page/welcome_screen.dart';
import 'package:food_app/screens/make_diet/making_diet_done/making_diet_done_screen.dart';
import 'package:food_app/screens/mealDetails/meal_details_screen.dart';
import 'package:food_app/screens/no_internet/no_internet_screen.dart';
import 'package:food_app/screens/premium_pages/share_done/share_done_screen.dart';
import 'package:food_app/screens/splash_page/splash_page_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  ////- to cancel the landscape mode- ///
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //Initialing the Firebase.
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  //To make the app work only in vertical position.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  //Initializing the notifications.
  AwesomeNotifications()
      .initialize('resource://drawable/res_notification_icon', [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: oldSplashColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'basic notifation')
  ]);

  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String name = 'Awesome Notifications - Example App';
  static const Color mainColor = Colors.deepPurple;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("fa", "IR")],
      locale: Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,

      title: 'DietLark',
      theme: ThemeData(
          //we apply this beacuse most of out appbar have this style.
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          primaryColor: seventhColorPackage2,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white),
      home: SplashScreen(),
      builder: EasyLoading.init(),
      //initialRoute: "/splash",
      //initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/two": (context) => FoodCategories(),
        "/home": (context) => HomeScreen(),
        "/welcome": (context) => WelcomePage(),
        "/makingDietDone": (context) => MakingDietDone(),
        "/shareDone": (context) => ShareDone(),
        "/mealDetails": (context) => MealDetails(),
        '/noInternet': (context) => NoInternet(),
        '/myDiet': (context) => MyDiet()
      },
    );
  }
}
