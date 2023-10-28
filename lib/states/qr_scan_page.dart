import 'package:blindhelp/states/display_result_qr_scan.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: ScanView(
          controller: scanController,
          onCapture: (data) {
            print('##28oct value scan ----> $data');
            Get.off(DisplayResultQRscan(resultQR: data.toString()));
          },
        ),
      ),
    );
  }
}
