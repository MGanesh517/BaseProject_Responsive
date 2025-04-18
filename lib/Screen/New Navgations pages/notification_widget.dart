
import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  const NotificationPopup({super.key});

  List<NotificationData> generateNotifications() {
    List<NotificationData> notifications = [];
    for (int i = 1; i <= 150; i++) {
      notifications.add(
        NotificationData(
          id: i,
          title: 'Notification $i',
          message:
              'This is notification message number $i. It contains some details about the notification.   ',
          time: '${i % 24} hours ago',
          isRead: i % 3 == 0, // Every third notification is read
          type: NotificationType
              .values[i % 3], // Cycle through notification types
        ),
      );
    }
    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      elevation: 2,
      offset: Offset(-10, 65),
      tooltip: 'Notifications',
      icon: Stack(
        children: [
          Icon(Icons.notifications_outlined, size: 24),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                ' ${generateNotifications().length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      onSelected: (value) {
        print('Selected notification: $value');
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false, // Disable the container itself from being clickable
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: 350,
            height: 450,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications' + ' (${generateNotifications().length})',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // TextButton(
                          //   onPressed: () {
                          //     // Mark all as read
                          //     Navigator.pop(context);
                          //   },
                          //   child: Text('Mark all as read'),
                          // ),
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: generateNotifications().length +
                            1, // +1 for "View All" button
                        separatorBuilder: (context, index) =>
                            Divider(height: 1),
                        itemBuilder: (context, index) {
                          if (index == generateNotifications().length) {
                            return Container(
                              height: 30,
                              // width: double.infinity,
                              // padding: EdgeInsets.symmetric(vertical: 12),
                              // child: TextButton(
                              //   onPressed: () {
                              //     Navigator.pop(context);
                              //     print('View all notifications');
                              //   },
                              //   child: Text('View All Notifications'),
                              // ),
                            );
                          }

                          final notification = generateNotifications()[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // Handle notification click
                              print('Clicked notification ${notification.id}');
                            },
                            child: NotificationCard(
                              title: notification.title,
                              message: notification.message,
                              time: notification.time,
                              isRead: notification.isRead,
                              type: notification.type,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          print('View all notifications');
                        },
                        child: Text('View All Notifications'),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationData {
  final int id;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final NotificationType type;

  NotificationData({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.type,
  });
}

enum NotificationType { message, system, task }

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final NotificationType type;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.type,
  });

  IconData getIcon() {
    switch (type) {
      case NotificationType.message:
        return Icons.message_outlined;
      case NotificationType.system:
        return Icons.system_update_outlined;
      case NotificationType.task:
        return Icons.task_outlined;
    }
  }

  Color getColor() {
    switch (type) {
      case NotificationType.message:
        return Colors.blue;
      case NotificationType.system:
        return Colors.orange;
      case NotificationType.task:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isRead ? Colors.transparent : Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: getColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              getIcon(),
              color: getColor(),
              size: 20,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight:
                              isRead ? FontWeight.normal : FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
