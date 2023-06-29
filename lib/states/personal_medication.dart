import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class PersonanMedication extends StatelessWidget {
  const PersonanMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const WidgetText(data: 'ยาประจำตัว'),),);
  }
}