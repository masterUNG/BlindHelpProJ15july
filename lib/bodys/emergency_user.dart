import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_emergency_call.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyUser extends StatelessWidget {
  const EmergencyUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: WidgetEmergencyCall(),
    );
  }
}
