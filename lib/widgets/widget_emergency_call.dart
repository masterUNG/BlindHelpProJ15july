import 'package:blindhelp/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetEmergencyCall extends StatelessWidget {
  const WidgetEmergencyCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
        label: 'โทรฉุกเฉิน',
        pressFunc: () async {
          final Uri uri = Uri.parse('tel:1669');
          await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'Cannot Call';
        },
        iconData: Icons.phone);
  }
}
