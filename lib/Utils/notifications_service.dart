// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationServices extends ChangeNotifier {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
//   // final enquiryController = Get.put(EnquiryController1());

//   static Future initialize(BuildContext context) async {
//     const InitializationSettings initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//       iOS: DarwinInitializationSettings(),
//     );

//     await _notificationsPlugin.initialize(
//       initializationSettings,
//       // onDidReceiveNotificationResponse: (),
//       onDidReceiveNotificationResponse: (payload) async {
//         print("Print Payl;oad: $payload");
//         int id;
//         String page;
//         final fullUrl = payload.payload!.split('/');
//         //
//         print("page : ${fullUrl}");
//         print("PAYLOADBYTEJA : $payload");
//         page = fullUrl[0];
//         print("page : $page");
//         id = int.parse(fullUrl[1]);
//         print("Id: $id");

//         // final walletController = Get.put(WalletController());
//         // final subscriptionController = Get.put(SubscriptionController());
//         // final ordersController = Get.put(OrderController());

//         // if (fullUrl[1] == 'vacation') {
//         //   Get.toNamed(Routes.vacationModeView);
//         // } else if (fullUrl[1] == 'Wallet Recharge') {
//         //   walletController.walletRechargeIsRefresh = true;
//         //   walletController.getWalletRechargeList();
//         // } else if (fullUrl[1] == 'Cash Collection') {
//         //   walletController.cashCollectionRequestIsRefresh = true;
//         //   walletController.getCashCollectionRequestList();
//         // } else if (fullUrl[1] == 'Subscription Created') {
//         //   subscriptionController.getSubscriptionsDetails(id);
//         // } else if (fullUrl[1] == 'Customer Order') {
//         //   ordersController.getOrdersDetails(id);
//         // }
//       },
//     );
//   }

//   static _notificationDetails() {
//     // final sound = 'buzzer.mp3';
//     // final sound = 'notification_sound.mp3';
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         "high_importance_channel",
//         "notification channel",
//         importance: Importance.high,
//         showProgress: true,
//         enableVibration: true,
//         playSound: true,
//         // sound: RawResourceAndroidNotificationSound('notification_sound'),
//       ),
//       iOS: DarwinNotificationDetails(
//           // sound: 'clock-alarm-8761.mp3',
//           ),
//     );
//   }

//   static void display(RemoteMessage? message) async {
//     try {
//       // int id = int.parse(message!.data['ref_id']);
//       // String type = message.data['type'];
//       print("Printing Notification Message::::::::::::${message!.toMap()}");
//       print("Printing Notification Message::::::::::::${message.toMap()}");
//       String payload = '';

//       print("payload $payload");
//       await _notificationsPlugin.show(
//         12,
//         message.notification!.title,
//         message.notification!.body,
//         await _notificationDetails(),
//         payload: payload,
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
// }
