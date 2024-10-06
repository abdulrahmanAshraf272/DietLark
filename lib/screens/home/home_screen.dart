import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/notifications.dart';
import 'package:food_app/screens/home/components/body.dart';
import 'package:food_app/screens/mealDetails/meal_details_screen.dart';
import 'package:food_app/size_config.dart';

class HomeScreen extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String name = 'Awesome Notifications - Example App';
  static const Color mainColor = Colors.deepPurple;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              "هل انت متأكد ؟",
              style: TextStyle(fontFamily: kPrimaryFont),
            ),
            content: new Text(
              "انك تريد الخروج من التطبيق",
              style: TextStyle(fontFamily: kPrimaryFont),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'لا',
                  style: TextStyle(fontFamily: kPrimaryFont),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'نعم',
                  style: TextStyle(fontFamily: kPrimaryFont),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);

    // TODO: implement initState
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    //to be able to do something with the result we use -- then --.
    /*AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "تفعيل الاشعارات",
                    style: TextStyle(fontFamily: kPrimaryFont),
                  ),
                  content: Text('ينصح بتفعيل الاشعارات لتستقبل كل ما هو جديد.',
                      style: TextStyle(fontFamily: kPrimaryFont)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("الغاء",
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: Colors.grey,
                                fontSize: 18))),
                    TextButton(
                        onPressed: () => AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((value) => Navigator.pop(context)),
                        child: Text("تفعيل",
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: oldSplashColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))
                  ],
                ));
      }
    });
    */
    /*
    AwesomeNotifications().createdStream.listen((value) {
      print("hello");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("created")));
    });

    AwesomeNotifications().actionStream.listen((event) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MealDetails()),
          (route) => route.isFirst);
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
