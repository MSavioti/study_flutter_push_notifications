import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_push_notifications/app/pages/home/widgets/notifications_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => _listenToMessage(value),
        );
    FirebaseMessaging.onMessage.listen(_listenToMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_listenToMessage);
  }

  void _listenToMessage(RemoteMessage? message) {
    if (message == null) {
      print('No new notifications.');
      return;
    }

    print('message arrived');
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
    // setState(() {
    //   messageTitle = message.data["title"];
    //   notificationAlert = "Application opened from Notification";
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          NotificationsButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
