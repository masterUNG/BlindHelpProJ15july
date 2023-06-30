import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class EmergencyCall extends StatelessWidget {
  const EmergencyCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const WidgetText(data: 'ช่องทางติดต่อฉุกเฉิน'),),);
  }
}