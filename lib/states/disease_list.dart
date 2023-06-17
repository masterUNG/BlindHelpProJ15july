import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseList extends StatelessWidget {
  const DiseaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'โรคประจำตัว :'),
      ),
      floatingActionButton: WidgetButton(
          label: 'เพิ่ม โรคประจำตัว',
          pressFunc: () {
            String? string;
            AppDialog(context: context).normalDialog(
                tilte: 'เพิ่ม โรคประจำตัว',
                contentWidget: WidgetForm(
                  labelWidget: const WidgetText(data: 'โรคประจำตัว'),
                  changeFunc: (p0) {
                    string = p0.trim();
                  },
                ),
                firstAction: WidgetButton(
                  label: 'เพิ่ม',
                  pressFunc: () {
                    if (string?.isEmpty ?? true) {
                      Get.back();
                    } else {
                      
                    }
                  },
                  iconData: Icons.add_box,
                  size: 100,
                ));
          },
          size: 190,
          iconData: Icons.add_box),
    );
  }
}
