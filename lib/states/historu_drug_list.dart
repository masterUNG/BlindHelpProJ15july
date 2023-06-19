import 'package:blindhelp/models/hitory_drug_model.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_text_rich.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDrugList extends StatefulWidget {
  const HistoryDrugList({super.key});

  @override
  State<HistoryDrugList> createState() => _HistoryDrugListState();
}

class _HistoryDrugListState extends State<HistoryDrugList> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readHistoryDrug();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'ประวัติการแพ้ยา :'),
      ),
      floatingActionButton: displayFloating(context),
      body: Obx(() {
        return appController.historyDrugModels.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: appController.historyDrugModels.length,
                itemBuilder: (context, index) => Container(padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: AppConstant().borderBox(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetTextRich(
                          title: 'ประวัติการแพ้ยา :',
                          value:
                              appController.historyDrugModels[index].historyDrug),
                      WidgetTextRich(
                          title: 'วันเดือนปี ที่บันทึก :',
                          titleColor: AppConstant.bluelive,
                          value: AppService().timeStampToString(
                              timestamp: appController
                                  .historyDrugModels[index].timestamp)),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  WidgetButton displayFloating(BuildContext context) {
    return WidgetButton(
        label: 'เพิ่ม ประวัติการแพ้ยา',
        pressFunc: () {
          String? string;
          AppDialog(context: context).normalDialog(
              tilte: 'เพิ่ม ประวัติการแพ้ยา',
              contentWidget: WidgetForm(
                labelWidget: const WidgetText(data: 'เพิ่ม ประวัติการแพ้ยา'),
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
                            title: 'ยังไม่ได้ใส่ ประวัติการแพ้ยา',
                            message: 'โปรดกรอก ประวัติการแพ้ยา ด้วยคะ')
                        .errorSnackBar();
                  } else {
                    HistoryDrugModel historyDrugModel = HistoryDrugModel(
                        historyDrug: string!,
                        timestamp: Timestamp.fromDate(DateTime.now()));

                    AppService()
                        .addHistoryDrug(historyDrugModel: historyDrugModel)
                        .then((value) {
                      Get.back();
                      AppService().readHistoryDrug();
                      AppSnackBar(
                              context: context,
                              title: 'เพิ่มประวัติการแพ้ยา สำเร็จ',
                              message: 'เพิ่มประวัติการแพ้ยา $string สำเร็จ')
                          .normalSnackBar();
                    });
                  }
                },
                iconData: Icons.add_box,
                size: 100,
              ));
        },
        iconData: Icons.add_box);
  }
}
