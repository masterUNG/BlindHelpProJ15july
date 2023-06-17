import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class HistoryDrugList extends StatelessWidget {
  const HistoryDrugList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const WidgetText(data: 'ประวัติการแพ้ยา :'),),);
  }
}