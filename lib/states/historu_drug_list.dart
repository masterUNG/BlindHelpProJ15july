import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class HistoryDrugList extends StatefulWidget {
  const HistoryDrugList({super.key});

  @override
  State<HistoryDrugList> createState() => _HistoryDrugListState();
}

class _HistoryDrugListState extends State<HistoryDrugList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'ประวัติการแพ้ยา :'),
      ),floatingActionButton: displayFloating(context),
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
                    // DiseaseModel diseaseModel = DiseaseModel(
                    //     disease: string!,
                    //     timestamp: Timestamp.fromDate(DateTime.now()));
                    // AppService()
                    //     .addDisease(diseaseModel: diseaseModel)
                    //     .then((value) {
                    //   Get.back();
                    //   AppService().readDisease();
                    //   AppSnackBar(
                    //           context: context,
                    //           title: 'เพิ่มโรคประจำตัว สำเร็จ',
                    //           message: 'เพิ่มโรค $string สำเร็จ')
                    //       .normalSnackBar();
                    // });
                  }
                },
                iconData: Icons.add_box,
                size: 100,
              ));
        },
        size: 190,
        iconData: Icons.add_box);
  }
}
