import 'package:blindhelp/models/disease_model.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                      AppSnackBar(
                              context: context,
                              title: 'ยังไม่ได้ใส่ โรคประจำตัว',
                              message: 'โปรดกรอก โรคประจำตัว ด้วยคะ')
                          .errorSnackBar();
                    } else {
                      DiseaseModel diseaseModel = DiseaseModel(
                          disease: string!,
                          timestamp: Timestamp.fromDate(DateTime.now()));
                      AppService()
                          .addDisease(diseaseModel: diseaseModel)
                          .then((value) {
                        Get.back();
                        AppSnackBar(
                                context: context,
                                title: 'เพิ่มโรคประจำตัว สำเร็จ',
                                message: 'เพิ่มโรค $string สำเร็จ')
                            .normalSnackBar();
                      });
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
