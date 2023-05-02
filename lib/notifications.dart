import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notificationList[index].title),
            subtitle: Text(notificationList[index].date),
            onTap: () {
              // Handle the tap for each notification
            },
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String date;

  NotificationItem({required this.title, required this.date});
}

// Sample data for notificationList
List<NotificationItem> notificationList = [
  NotificationItem(title: 'Notification 1', date: '2023-05-01 10:00 AM'),
  NotificationItem(title: 'Notification 2', date: '2023-05-01 09:00 AM'),
  NotificationItem(title: 'Notification 3', date: '2023-04-30 03:00 PM'),
  // Add more notifications here if needed
];
