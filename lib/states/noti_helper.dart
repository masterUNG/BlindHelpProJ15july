import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotiHelper extends StatefulWidget {
  const NotiHelper({super.key});

  @override
  State<NotiHelper> createState() => _NotiHelperState();
}

class _NotiHelperState extends State<NotiHelper> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Scaffold(
          body: appController.userModelLogins.isEmpty ? const SizedBox() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetText(data: 'สวัสดี  ชืออาสาสมัคร'),
              WidgetText(data: 'กล่องข้อความขอความช่วยเหลือล่าสุด 0 คน'),
              WidgetText(data: 'รูปถ่ายฉลากยาล่าสุด 0 รายการ'),
              WidgetText(data: 'บทความใหม่จำนวน 0 บทความ'),
            ],
          ),
        );
      }
    );
  }
}
