import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class InfoHelper extends StatelessWidget {
  const InfoHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const WidgetText(data: 'ข้อมูลส่วนตัว'),),
    );
  }
}