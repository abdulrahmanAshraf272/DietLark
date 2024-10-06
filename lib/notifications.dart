import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/main.dart';
import 'package:food_app/notification_database.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/mealDetails/meal_details_screen.dart';
import 'package:food_app/utilities.dart';

Future<void> createMealsTimeNotifications() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'وقت الغداء ${Emojis.smile_face_savoring_food}',
        body: 'انقر للتذكير لمحتوى الوجبة وقيمتها الغذائية.'),
  );
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    print("notifications created");
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    print("dismissed");
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    HoldValues.notificationDirection = 3;
    print(HoldValues.notificationDirection);
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    /*
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
    */
  }
}

Future<void> luanchScheduledNotifications(
    String channelKey, int number, String title, String subtitle) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 9 + number,
      channelKey: 'basic_channel',
      title: title,
      body: subtitle,
    ),
    schedule: NotificationCalendar(
        year: DateTime.now().year,
        day: DateTime.now().day + number,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        repeats: false),
  );
}

void lunchAllNotification() {
  String channelKey = 'basic_channel';

  luanchScheduledNotifications(channelKey, 1, '', '');
}
