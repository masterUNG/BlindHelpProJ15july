import 'package:blindhelp/models/drug_label_model.dart';
import 'package:blindhelp/states/qr_scan_page.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_image_network.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_text_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReadDrugLabel extends StatefulWidget {
  const ReadDrugLabel({super.key});

  @override
  State<ReadDrugLabel> createState() => _ReadDrugLabelState();
}

class _ReadDrugLabelState extends State<ReadDrugLabel> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readDrugLableByUid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return Obx(() {
          return appController.drugLabelModels.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 64),
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
                                bottom: 4,
                                right: 4,
                                child: WidgetButton(
                                    size: 130,
                                    label: 'ลบฉลาก',
                                    pressFunc: () {
                                      AppDialog(context: context).normalDialog(
                                          tilte: 'ลบฉลาก',
                                          iconWidget: WidgetImageNewwork(
                                              url: appController
                                                  .drugLabelModels[index]
                                                  .urlLabel),
                                          firstAction: WidgetButton(
                                              size: 130,
                                              color: Colors.red,
                                              label: 'ลบฉาก',
                                              pressFunc: () {
                                                AppService()
                                                    .deleteDrugLabel(
                                                        docIdDrugLabel:
                                                            appController
                                                                    .docIdDrugLabels[
                                                                index])
                                                    .then((value) {
                                                  Get.back();
                                                  AppService()
                                                      .readDrugLableByUid();
                                                });
                                              },
                                              iconData: Icons.delete_forever));
                                    },
                                    color: Colors.red,
                                    iconData: Icons.delete_forever),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
      }),
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetButton(
              label: 'QR Scan',
              pressFunc: () {
                // AppService().getQrData();

                Get.to(const QrScanPage());
              },
              iconData: Icons.qr_code,
              size: 150,
            ),
            WidgetButton(
                size: 160,
                label: 'เพิ่มฉลากยา',
                pressFunc: () {
                  AppDialog(context: context).normalDialog(
                    tilte: 'เพิ่มฉลากยา',
                    contentWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(data: 'โปรดเลือกวีธี การเพิ่มฉลากยา'),
                      ],
                    ),
                    firstAction: WidgetTextButton(
                      label: 'Camera',
                      pressFunc: () {
                        Get.back();
                        processTakePhotoUpdateInsert(
                            imageSource: ImageSource.camera);
                      },
                    ),
                    secondAction: WidgetTextButton(
                      label: 'Gallery',
                      pressFunc: () {
                        Get.back();
                        processTakePhotoUpdateInsert(
                            imageSource: ImageSource.gallery);
                      },
                    ),
                  );
                },
                iconData: Icons.add_box),
          ],
        ),
      ),
    );
  }

  Future<void> processTakePhotoUpdateInsert(
      {required ImageSource imageSource}) async {
    AppService().takePhoto(imageSource: imageSource).then((value) async {
      String? urlImage = await AppService().uploadImage(path: 'druglabel');
      if (urlImage != null) {
        DrugLabelModel drugLabelModel = DrugLabelModel(
            urlLabel: urlImage,
            textLabel: '',
            timestamp: Timestamp.fromDate(DateTime.now()),
            mapUserModel: appController.userModelLogins.last.toMap(),
            mapHelperModel: {});

        await FirebaseFirestore.instance
            .collection('user')
            .doc(appController.userModelLogins.last.uid)
            .collection('druglabel')
            .doc()
            .set(drugLabelModel.toMap())
            .then((value) => AppService().readDrugLableByUid());
      }
    });
  }
}
