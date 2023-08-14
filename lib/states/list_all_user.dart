// ignore_for_file: avoid_print

import 'package:blindhelp/models/check_home_user.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAllUser extends StatefulWidget {
  const ListAllUser({super.key});

  @override
  State<ListAllUser> createState() => _ListAllUserState();
}

class _ListAllUserState extends State<ListAllUser> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'เพิ่มรายการตรวจเยี่ยมบ้าน'),
      ),
      body: Obx(() {
        return appController.userModelHelper.isEmpty
            ? const SizedBox()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: appController.userModelHelper.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: AppConstant().borderBox(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetText(
                        data: appController.userModelHelper[index].name,
                        textStyle: AppConstant().titleStyle(context: context),
                      ),
                      WidgetButton(
                        size: 100,
                        label: 'เพิ่ม',
                        pressFunc: () {
                          AppDialog(context: context).normalDialog(
                              tilte: 'เพิ่มรายการ',
                              contentWidget: WidgetText(
                                  data:
                                      'เพิ่มรายการ ${appController.userModelHelper[index].name} ไปยังรายการตรวจเยี่ยมบ้น'),
                              firstAction: WidgetButton(
                                  size: 100,
                                  label: 'เพิ่ม',
                                  pressFunc: () async {
                                    print(
                                        'uidLogin --> ${appController.userModelLogins.last.uid}');

                                    CheckHomeUser checkHomeUser = CheckHomeUser(
                                        recordTimestamp:
                                            Timestamp.fromDate(DateTime.now()),
                                        mapUser: appController
                                            .userModelHelper[index]
                                            .toMap());

                                    FirebaseFirestore.instance
                                        .collection('user')
                                        .doc(appController
                                            .userModelLogins.last.uid)
                                        .collection('checkhome')
                                        .doc()
                                        .set(checkHomeUser.toMap())
                                        .then((value) {
                                      Get.back();
                                      Get.back();
                                      AppSnackBar(
                                              context: context,
                                              title: 'เพิ่มรายการสำเร็จ',
                                              message:
                                                  'เพิ่มรายการผู้ป่วยที่ต้องไปเยี่ยมบ้านเรียบร้อย')
                                          .normalSnackBar();
                                    });
                                  },
                                  iconData: Icons.add_box));
                        },
                        iconData: Icons.add_box,
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
