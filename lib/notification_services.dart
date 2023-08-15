// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:practice_app/main.dart';
// import 'package:practice_app/notification_screen.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {}

// class NotificationServices {
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   AndroidNotificationChannel androidNotificationChannel =
//       const AndroidNotificationChannel('high_importance_channel', 'channelName',
//           description: 'Description',
//           importance: Importance.max,
//           playSound: true);

//   Future<void> initializeLocalNotification() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         const AndroidInitializationSettings('logo');

//     InitializationSettings initializationSettings =
//         InitializationSettings(android: androidInitializationSettings);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       // onDidReceiveNotificationResponse: (payload) {
//       //   final message =
//       //       RemoteMessage.fromMap(jsonEncode(payload) as Map<String, dynamic>);
//       //   handleBackgroundMessage(message);
//       // },
//     );
//     // AndroidFlutterLocalNotificationsPlugin? platform =
//     //     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//     //         AndroidFlutterLocalNotificationsPlugin>();
//     // await platform?.createNotificationChannel(androidNotificationChannel);
//   }

//   Future<void> handleMessage(RemoteMessage? message) async {
//     if (message == null) return;

//     navigatorKey.currentState
//         ?.pushNamed(NotificationScreen.route, arguments: message);
//   }

//   Future<void> pushNotification() async {
//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);
//     await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if (notification == null) return;
//       flutterLocalNotificationsPlugin.show(
//         0,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//             android: AndroidNotificationDetails(
//                 androidNotificationChannel.id, androidNotificationChannel.name,
//                 channelDescription: androidNotificationChannel.description,
//                 importance: Importance.max,
//                 playSound: true,
//                 largeIcon: const DrawableResourceAndroidBitmap('logo'),
//                 icon: 'logo')),
//         // payload: jsonEncode(message.toMap()
//         // )
//       );
//     });
//   }

//   Future<void> initNotification() async {
//     await firebaseMessaging.requestPermission();
//     String? fcmToken = await firebaseMessaging.getToken();
//     print('Token: $fcmToken');
//     initializeLocalNotification();
//     pushNotification();
//   }
// }
