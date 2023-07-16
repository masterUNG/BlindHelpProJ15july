import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_image_network.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckDrugLabel extends StatefulWidget {
  const CheckDrugLabel({super.key});

  @override
  State<CheckDrugLabel> createState() => _CheckDrugLabelState();
}

class _CheckDrugLabelState extends State<CheckDrugLabel> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readAllDrugLabel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Obx(() {
        return appController.drugLabelModels.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: appController.drugLabelModels.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 4, left: 4, bottom: 4),
                  decoration: AppConstant().borderBox(),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        width: boxConstraints.maxWidth * 0.5,
                        height: boxConstraints.maxWidth * 0.4,
                        child: WidgetImageNewwork(
                          url: appController.drugLabelModels[index].urlLabel,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: boxConstraints.maxWidth * 0.5 - 10,
                        height: boxConstraints.maxWidth * 0.4,
                        child: Stack(
                          children: [
                            WidgetText(
                                data: appController
                                    .drugLabelModels[index].textLabel),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  TextEditingController textEditingController =
                                      TextEditingController();
                                  AppDialog(context: context).normalDialog(
                                      tilte: 'แก้ไขฉลากยา',
                                      iconWidget: WidgetImageNewwork(
                                        url: appController
                                            .drugLabelModels[index].urlLabel,
                                        height: 150,
                                        boxFit: BoxFit.cover,
                                      ),
                                      contentWidget: WidgetForm(
                                        textEditingController:
                                            textEditingController,
                                      ),
                                      firstAction: WidgetButton(
                                          size: 140,
                                          label: 'แก้ไข',
                                          pressFunc: () {
                                            if (textEditingController
                                                .text.isNotEmpty) {
                                              Map<String, dynamic> map =
                                                  appController
                                                      .drugLabelModels[index]
                                                      .toMap();
                                              map['textLabel'] =
                                                  textEditingController.text;
                                              map['mapHelperModel'] =
                                                  appController
                                                      .userModelLogins.last
                                                      .toMap();

                                              AppService()
                                                  .editDrugLabel(
                                                      docIdDrugLabel: appController
                                                              .docIdDrugLabels[
                                                          index],
                                                      docIdUser: appController
                                                          .drugLabelModels[
                                                              index]
                                                          .mapUserModel['uid'],
                                                      map: map)
                                                  .then((value) {
                                                AppService()
                                                    .readAllDrugLabel()
                                                    .then(
                                                        (value) => Get.back());
                                              });
                                            }
                                            Get.back();
                                          },
                                          iconData: Icons.edit));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  width: 48,
                                  height: 48,
                                  padding: const EdgeInsets.all(4),
                                  decoration: AppConstant()
                                      .borderBox(bgColor: Colors.blue),
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      WidgetText(
                                        data: 'แก้ไข',
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      });
    });
  }
}
