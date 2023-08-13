import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class EditInfoHelper extends StatelessWidget {
  const EditInfoHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const WidgetText(data: 'แก้ไขข้อมูลส่วนตัว'),),);
  }
}