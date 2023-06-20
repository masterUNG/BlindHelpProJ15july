import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:flutter/material.dart';

class EditDisibility extends StatelessWidget {
  const EditDisibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const WidgetText(data: 'รายละเอียดความพิการด้านดวงตาและการมองเห็น'),
      ),
      body: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetTitle(title: 'รายละเอียดความพิการ\nด้านดวงตาและการมองเห็น'),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetButton(
                  label: 'แก้ไข', pressFunc: () {}, iconData: Icons.edit),
            ],
          ),
        ],
      ),
    );
  }
}
