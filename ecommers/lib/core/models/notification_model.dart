class NotificationModel {
  final String orderNumber;
  final String notificationUsualText;
  final String statusText;
  final bool isCheckedItem;
  final String imagePath;

  NotificationModel({
    this.orderNumber,
    this.imagePath,
    this.notificationUsualText,
    this.isCheckedItem,
    this.statusText,
  });
}