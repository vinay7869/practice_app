// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   static const route = '/notificationScreen';
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     RemoteMessage? messages =
//         ModalRoute.of(context)!.settings.arguments as RemoteMessage?;
//     return Scaffold(
//         appBar: AppBar(title: const Text('Notification Screen')),
//         body: ListView(
//           children: [
//             messages != null
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       tileColor: Colors.grey.shade300,
//                       title: Text('${messages.notification!.title}'),
//                       titleTextStyle: const TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           color: Colors.black),
//                       subtitle: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text('${messages.notification!.body}'),
//                       ),
//                     ),
//                   )
//                 : const Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 100),
//                       SizedBox(
//                         height: 150,
//                         width: 150,
//                         child: Image(
//                           image: NetworkImage(
//                               'https://pngimg.com/uploads/exclamation_mark/exclamation_mark_PNG48.png'),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'No new notification',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w700),
//                       )
//                     ],
//                   )
//           ],
//         ));
//   }
// }


// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // class NotificationServices {
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   final AndroidInitializationSettings androidInitializationSettings =
// //       const AndroidInitializationSettings('logo');

// //   void initialize() async {
// //     InitializationSettings initializationSettings =
// //         InitializationSettings(android: androidInitializationSettings);

// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }

// //   final AndroidNotificationDetails androidNotificationDetails =
// //       const AndroidNotificationDetails('channelId', 'channelName',
// //           importance: Importance.max,
// //           channelShowBadge: true,
// //           icon: 'logo',
// //           largeIcon: DrawableResourceAndroidBitmap('logo'));

// //   void sendNotification(String? title, String? body) async {
// //     NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidNotificationDetails);

// //     await flutterLocalNotificationsPlugin.show(
// //         0, title, body, notificationDetails);
// //   }

// //   void scheduleNotification(String? title, String? body) async {
// //     NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidNotificationDetails);

// //     await flutterLocalNotificationsPlugin.periodicallyShow(
// //         0, title, body, RepeatInterval.daily, notificationDetails);
// //   }

// //   void stopNotification() async {
// //     flutterLocalNotificationsPlugin.cancel(0);
// //   }

// //   void bigPictureNotification(String? title, String? body) async {
// //     AndroidNotificationDetails androidNotificationDetails =
// //         const AndroidNotificationDetails('channelId', 'channelName',
// //             styleInformation: BigPictureStyleInformation(
// //                 DrawableResourceAndroidBitmap('logo')),
// //             importance: Importance.max,
// //             channelShowBadge: true,
// //             icon: 'logo',
// //             largeIcon: DrawableResourceAndroidBitmap('logo'));
// //     NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidNotificationDetails);

// //     await flutterLocalNotificationsPlugin.show(
// //         1, title, body, notificationDetails);
// //   }
// // }

