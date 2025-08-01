import 'package:apple_invites/screens/models/notification_model.dart';

class NotificationViewModel {
  static List<NotificationModel> listOfNotification = [
    // ✅ Today
    NotificationModel(
      title: "Meeting with CEO",
      message: "Your 1:1 with the CEO is scheduled at 4:00 PM today.",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "Event reminder",
      message: "Don't forget the product launch event at 6:00 PM.",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "New comment",
      message: "Sarah commented on your task: 'Great job!'",
      date: DateTime.now(),
    ),
    NotificationModel(
      title: "App update available",
      message: "Version 3.2.1 is now available with new features.",
      date: DateTime.now(),
    ),
    // ✅ Last Week
    NotificationModel(
      title: "Team outing photos",
      message: "Your team shared 12 new photos from the weekend.",
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      title: "Password changed",
      message: "You successfully changed your password.",
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    NotificationModel(
      title: "Weekly report",
      message: "Your weekly progress report is now available.",
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    NotificationModel(
      title: "Subscription renewed",
      message: "Your Premium plan has been renewed successfully.",
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    NotificationModel(
      title: "Feedback requested",
      message: "How would you rate your recent experience?",
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    NotificationModel(
      title: "Payment received",
      message: "We received your payment of \$49.99.",
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    // ✅ Earlier
    NotificationModel(
      title: "Monthly summary",
      message: "Your activity summary for May is ready.",
      date: DateTime.now().subtract(Duration(days: 8)),
    ),
    NotificationModel(
      title: "Login from new device",
      message: "A new login was detected from Mumbai, India.",
      date: DateTime.now().subtract(Duration(days: 10)),
    ),
    NotificationModel(
      title: "Backup completed",
      message: "Your cloud backup was completed successfully.",
      date: DateTime.now().subtract(Duration(days: 15)),
    ),
    NotificationModel(
      title: "System maintenance",
      message: "Scheduled maintenance was completed on June 1.",
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    NotificationModel(
      title: "App feedback survey",
      message: "Take 2 minutes to help us improve the app.",
      date: DateTime.now().subtract(Duration(days: 30)),
    ),
    NotificationModel(
      title: "Account verification",
      message: "Your email address was successfully verified.",
      date: DateTime.now().subtract(Duration(days: 45)),
    ),
  ];
}
