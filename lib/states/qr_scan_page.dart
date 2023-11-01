// ignore_for_file: avoid_print

import 'dart:io';

import 'package:blindhelp/states/display_result_qr_scan.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_icon_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  ScanController scanController = ScanController();

  @override
  void dispose() {
    scanController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScanView(
              controller: scanController,
              onCapture: (data) {
                print('##28oct value scan ----> $data');
                Get.off(DisplayResultQRscan(resultQR: data.toString()));
              },
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetIconButton(
                    iconData: Icons.flash_on,
                    pressFunc: () {
                      scanController.toggleTorchMode();
                    },
                    size: 36,
                    color: Colors.white,
                  ),
                   WidgetText(
                    data: 'เปิดแฟลซ',
                    textStyle: AppConstant()
                        .titleStyle(context: context, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetIconButton(
                    iconData: Icons.clear,
                    pressFunc: () {
                      Get.back();
                    },
                    size: 36,
                    color: Colors.white,
                  ),
                  WidgetText(
                    data: 'ปิด',
                    textStyle: AppConstant()
                        .titleStyle(context: context, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetIconButton(
                    iconData: Icons.photo_library,
                    pressFunc: () async {
                      var result = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (result != null) {
                        File file = File(result.path);
                        await Scan.parse(file.path).then((value) {
                          print('##30oct value scan ---> $value');
                          if (value != null) {
                            Get.off(DisplayResultQRscan(resultQR: value));
                          }
                        });
                      }
                    },
                    size: 36,
                    color: Colors.white,
                  ),
                   WidgetText(
                    data: 'สแกนจากภาพ',
                    textStyle: AppConstant()
                        .titleStyle(context: context, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
