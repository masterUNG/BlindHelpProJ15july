// ignore_for_file: avoid_print

import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_circle_image.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileUser extends StatefulWidget {
  const EditProfileUser({super.key});

  @override
  State<EditProfileUser> createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  bool change = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  AppController controller = Get.put(AppController());
  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();

    nameController.text = controller.userModelLogins.last.name;
    surnameController.text = controller.userModelLogins.last.surName;
    bloodTypeController.text = controller.userModelLogins.last.bloodTyoe!;
    genderController.text = controller.userModelLogins.last.gender!;
    ageController.text = controller.userModelLogins.last.age!;
    weightController.text = controller.userModelLogins.last.weight!;
    heightController.text = controller.userModelLogins.last.height!;

    map = controller.userModelLogins.last.toMap();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('userModelLogins ===> ${appController.userModelLogins.length}');
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const WidgetText(data: 'แก้ไขข้อมูล'),
            ),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: ListView(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: AppConstant().borderBox(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const WidgetCircleImage(
                          radius: 45,
                        ),
                        SizedBox(
                          width: 218,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget: const WidgetText(data: 'ชื่อ'),
                                    textEditingController: nameController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['name'] = p0.trim();
                                    },
                                  ),
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget:
                                        const WidgetText(data: 'นามสกุล'),
                                    textEditingController: surnameController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['surName'] = p0.trim();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget:
                                        const WidgetText(data: 'กรุ๊ปเลือด'),
                                    textEditingController: bloodTypeController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['bloodTyoe'] = p0.trim();
                                    },
                                  ),
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget: const WidgetText(data: 'เพศ'),
                                    textEditingController: genderController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['gender'] = p0.trim();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget: const WidgetText(data: 'อายุ'),
                                    textEditingController: ageController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['age'] = p0.trim();
                                    },
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      DateTime dateTime = DateTime.now();
                                      await showDatePicker(
                                              context: context,
                                              initialDate: dateTime,
                                              firstDate:
                                                  DateTime(dateTime.year - 100),
                                              lastDate: dateTime)
                                          .then((value) {
                                        change = true;
                                        Timestamp timestamp =
                                            Timestamp.fromDate(value!);
                                        map['birth'] = timestamp;
                                      });
                                    },
                                    child: Container(
                                      decoration: AppConstant().borderBox(),
                                      width: 100,
                                      child: Column(
                                        children: [
                                          const WidgetText(
                                              data: 'วันเดือนปีเกิด'),
                                          WidgetText(
                                              data: appController
                                                          .userModelLogins
                                                          .last
                                                          .birth ==
                                                      Timestamp(0, 0)
                                                  ? '???'
                                                  : AppService()
                                                      .timeStampToString(
                                                          timestamp: appController
                                                              .userModelLogins
                                                              .last
                                                              .birth!)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget:
                                        const WidgetText(data: 'น้ำหนัก'),
                                    textEditingController: weightController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['weight'] = p0.trim();
                                    },
                                  ),
                                  WidgetForm(
                                    width: 100,
                                    marginTop: 0,
                                    labelWidget:
                                        const WidgetText(data: 'ส่วนสูง'),
                                    textEditingController: heightController,
                                    changeFunc: (p0) {
                                      change = true;
                                      map['height'] = p0.trim();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              WidgetButton(
                                  label: 'แก้ไขข้อมูล',
                                  pressFunc: () {
                                    if (change) {
                                      print('map ----> $map');
                                      AppService()
                                          .updateUser(data: map)
                                          .then((value) {
                                        AppService()
                                            .readUserModelLogin()
                                            .then((value) {
                                          Get.back();
                                          AppSnackBar(
                                                  context: context,
                                                  title: 'แก้ไขข้อมูล สำเร็จ',
                                                  message:
                                                      'แก้ไข ข้อมุลสำเร็จ แล้ว')
                                              .normalSnackBar();
                                        });
                                      });
                                    } else {
                                      print('work');
                                      AppSnackBar(
                                              context: context,
                                              title: 'ยังไม่มีการแก้ไขข้อมูล',
                                              message:
                                                  'กรุณาแก้ไขขัอมูล อย่างน้อย 1 จุด')
                                          .errorSnackBar();
                                    }
                                  },
                                  iconData: Icons.edit_document),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
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
  }
}
