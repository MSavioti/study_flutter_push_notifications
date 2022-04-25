import 'package:flutter/material.dart';
import 'package:study_flutter_push_notifications/app/shared/utils/notifications_utils.dart';

class NotificationsButton extends StatefulWidget {
  const NotificationsButton({Key? key}) : super(key: key);

  @override
  State<NotificationsButton> createState() => _NotificationsButtonState();
}

class _NotificationsButtonState extends State<NotificationsButton> {
  bool _hasNotifications = false;

  @override
  void initState() {
    _checkForNewNotifications();
    super.initState();
  }

  Future<void> _checkForNewNotifications() async {
    setState(() {
      NotificationsUtils.instance
          .checkForNewNotifications((m) => _hasNotifications = m != null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/notifications');
      },
      icon: _hasNotifications
          ? const Icon(Icons.notifications_active)
          : const Icon(Icons.notifications),
    );
  }
}
