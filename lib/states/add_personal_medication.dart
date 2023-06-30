import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class AddPersonanMedication extends StatelessWidget {
  const AddPersonanMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'เพิ่มยาประจำตัว'),
      ),
    );
  }
}
