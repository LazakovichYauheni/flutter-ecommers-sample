import 'package:ecommers/ui/decorations/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  final String assetImagePath;
  final String orderNumberText;
  final String richText;
  final String usualText;
  final bool isCheckedItem;


  const NotificationWidget({
    @required this.assetImagePath,
    @required this.orderNumberText,
    @required this.richText,
    @required this.usualText,
    @required this.isCheckedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(
          assetImagePath,
          fit: BoxFit.cover,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                richText,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                usualText,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                orderNumberText,
                overflow: TextOverflow.ellipsis,
                style : Theme.of(context).textTheme.bodyText1.copyWith(color: BrandingColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
