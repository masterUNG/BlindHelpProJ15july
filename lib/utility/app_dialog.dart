// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blindhelp/widgets/widget_image_asset.dart';
import 'package:blindhelp/widgets/widget_progress.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  final BuildContext context;
  AppDialog({
    required this.context,
  });

  void progressDialog() {
    Get.dialog(
        WillPopScope(
          child: const WidgetProgress(),
          onWillPop: () async {
            return false;
          },
        ),
        barrierDismissible: false);
  }

  void normalDialog({required String tilte, Widget? firstAction}) {
    Get.dialog(
      AlertDialog(
        icon: const WidgetImageAsset(
          size: 100,
        ),
        title: WidgetText(data: tilte),
        actions: [
          firstAction ?? const SizedBox(),
          WidgetTextButton(
            label: 'Cancel',
            pressFunc: () => Get.back(),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
