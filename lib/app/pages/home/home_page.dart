import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_push_notifications/app/pages/home/widgets/notifications_button.dart';
import 'package:study_flutter_push_notifications/app/shared/utils/notifications_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    if (NotificationsUtils.instance.isValidNotification(message)) {
      Navigator.of(context).pushNamed(
        '/notification',
        arguments: message!.notification,
      );
    }
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
      body: const Center(
        child: Text('Content'),
      ),
    );
  }
}
