import 'package:ecommers/core/models/notification_model.dart';
import 'package:ecommers/generated/i18n.dart';
import 'package:ecommers/ui/decorations/dimens/index.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:ecommers/ui/pages/closeable_page.dart';
import 'package:ecommers/ui/pages/index.dart';
import 'package:ecommers/ui/widgets/index.dart';
import 'package:ecommers/ui/widgets/notification/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static const _notificationDeviderIndent = 100.0;

  static String _getNotificationAssetPath(int index) {
    final modulo = index % 7;

    if (modulo == 0) return Assets.order;
    if (modulo == 1) return Assets.locationPin;
    if (modulo == 2) return Assets.discount;
    if (modulo == 3) {
      return Assets.tagIcon;
    } else {
      return Assets.order;
    }
  }

  final _notifications = List.generate(
    4,
    (index) => NotificationModel(
        statusText: 'shipped',
        notificationUsualText: 'marked your order',
        orderNumber: '#1982984',
        imagePath: _getNotificationAssetPath(index),
        isCheckedItem: false),
  );

  @override
  Widget build(BuildContext context) {
    return CloseablePage(
      child: BackgroundedSafeArea(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(Insets.x6, Insets.x0, Insets.x5, Insets.x4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                I18n.of(context).notificationsTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _buildNotificationListView(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationListView() {
    return ListView.separated(
      padding:
          const EdgeInsets.fromLTRB(Insets.x0, Insets.x0, Insets.x0, Insets.x0),
      itemCount: _notifications.length,
      itemBuilder: (BuildContext context, int index) {
        final currentNotification = _notifications[index];
        return NotificationWidget(
          isCheckedItem: currentNotification.isCheckedItem,
          assetImagePath: currentNotification.imagePath,
          orderNumberText: currentNotification.orderNumber,
          richText: currentNotification.statusText,
          usualText: currentNotification.notificationUsualText,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
              Insets.x0, Insets.x0, Insets.x0, Insets.x0),
          child: Divider(
            color: BrandingColors.secondary.withOpacity(0.4),
            indent: _notificationDeviderIndent,
          ),
        );
      },
    );
  }
}
