// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:flutter/material.dart';

import 'package:blindhelp/widgets/widget_image_asset.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:get/get.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readProvince();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const WidgetImageAsset(
          path: 'images/header.png',
          boxFit: BoxFit.cover,
        ),
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            const WidgetTitle(title: 'เลือกประเภทผู้ใช้งาน'),
            typeUserRadio(),
            const WidgetTitle(title: 'ข้อมูลส่วนตัว'),
            nameForm(),
            surnameForm(),
            phoneForm(),
            const WidgetTitle(title: 'ที่อยู่ผู้สมัคร'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: AppConstant().borderBox(),
                  width: 250,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8),margin: const EdgeInsets.only(top: 16),
                  child: Obx(() {
                    return appController.provinceNameThModels.isEmpty
                        ? const SizedBox()
                        : DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: appController.provinceNameThModels
                                .map(
                                  (element) => DropdownMenuItem(
                                    child: WidgetText(data: element.name_th),
                                    value: element,
                                  ),
                                )
                                .toList(),
                            value: appController.chooseProviceModels.last,
                            hint: const WidgetText(data: 'จังหวัด | Province'),
                            onChanged: (value) {
                              appController.chooseProviceModels.add(value);
                            },
                          );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row phoneForm() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetForm(
          labelWidget: WidgetText(data: 'เบอร์โทรติดต่อ'),
          marginBottom: 16,
        ),
      ],
    );
  }

  Row surnameForm() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetForm(labelWidget: WidgetText(data: 'นามสกุล')),
      ],
    );
  }

  Row nameForm() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetForm(
          labelWidget: WidgetText(data: 'ชื่อจริง'),
        ),
      ],
    );
  }

  Obx typeUserRadio() {
    return Obx(() => Column(
          children: [
            RadioListTile(
              value: AppConstant.typeUsers[0],
              groupValue: appController.typeUser.value,
              onChanged: (value) {
                appController.typeUser.value = value.toString();
              },
              title: WidgetText(data: AppConstant.typeUsers[0]),
            ),
            RadioListTile(
              value: AppConstant.typeUsers[1],
              groupValue: appController.typeUser.value,
              onChanged: (value) {
                appController.typeUser.value = value.toString();
              },
              title: WidgetText(data: AppConstant.typeUsers[1]),
            )
          ],
        ));
  }
}
