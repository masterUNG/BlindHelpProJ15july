import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonanMedication extends StatefulWidget {
  const PersonanMedication({super.key});

  @override
  State<PersonanMedication> createState() => _PersonanMedicationState();
}

class _PersonanMedicationState extends State<PersonanMedication> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    // AppService().readAllMediciene();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'ยาประจำตัว'),
      ),
      floatingActionButton: addMedication(context),
      body: listMediciene(),
    );
  }

  Widget listMediciene() {
    return Obx(() {
      return appController.medicieneModels.isEmpty
          ? const SizedBox()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  displayHead(),
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: appController.medicieneModels.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: WidgetText(
                              data: appController
                                  .medicieneModels[index].nameMedicene),
                        ),
                        Expanded(
                          child: WidgetText(
                              data: appController
                                  .medicieneModels[index].amountMedicene),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }

  Container displayHead() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: AppConstant().curveBox(context: context, radius: 0),
      child: const Row(
        children: [
          Expanded(
            child: WidgetTitle(
              title: 'ชื่อยา',
              size: 12,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: WidgetTitle(
              title: 'จำนวนครั้งใช้ยา',
              size: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  WidgetButton addMedication(BuildContext context) {
    return WidgetButton(
      label: 'เพิ่มยาประจำตัว',
      pressFunc: () {
        TextEditingController mediceneController = TextEditingController();
        TextEditingController amountController = TextEditingController();

        AppDialog(context: context).normalDialog(
          tilte: 'เพิ่มยาประจำตัว',
          contentWidget: Column(
            children: [
              WidgetForm(
                labelWidget: const WidgetText(data: 'ชื่อยา'),
                textEditingController: mediceneController,
              ),
              WidgetForm(
                labelWidget: const WidgetText(data: 'จำนวนครั้งใช้ยา'),
                textEditingController: amountController,
              ),
            ],
          ),
          firstAction: WidgetButton(
            label: 'เพิ่มยา',
            pressFunc: () {
              if ((mediceneController.text.isEmpty) ||
                  (amountController.text.isEmpty)) {
                Get.back();
                AppSnackBar(
                        context: context,
                        title: 'กรอกไม่ครบ',
                        message:
                            'กรุณากรอกให้ครบ ทุกช่อง ทั้ง ชื่อยา และ จำนวนครั้งทีีใช้ยา')
                    .errorSnackBar();
              } else {
                AppService()
                    .processAddMedicene(
                        nameMedicene: mediceneController.text,
                        amountMedicene: amountController.text)
                    .then((value) {
                  AppService().readAllMediciene().then((value) => Get.back());
                });
              }
            },
            iconData: Icons.add_box,
            size: 120,
          ),
        );
      },
      iconData: Icons.add_box,
      size: 200,
    );
  }
}
