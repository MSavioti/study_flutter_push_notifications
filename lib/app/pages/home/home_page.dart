import 'package:flutter/material.dart';
import 'package:study_flutter_push_notifications/app/pages/home/widgets/notifications_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          NotificationsButton(),
        ],
      ),
      body: Container(),
    );
  }
}
