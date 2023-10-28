// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_progress.dart';
import 'package:flutter/material.dart';

import 'package:blindhelp/widgets/widget_text.dart';
import 'package:get/get.dart';

class DisplayResultQRscan extends StatefulWidget {
  const DisplayResultQRscan({
    super.key,
    required this.resultQR,
  });

  final String resultQR;

  @override
  State<DisplayResultQRscan> createState() => _DisplayResultQRscanState();
}

class _DisplayResultQRscanState extends State<DisplayResultQRscan> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    appController.load.value = true;

    AppService().readQrFromResult(resultQr: widget.resultQR);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Obx(() {
        return appController.load.value
            ? const WidgetProgress()
            : WidgetText(data: 'data');
      })),
    );
  }
}
