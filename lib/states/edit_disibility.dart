import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDisibility extends StatefulWidget {
  const EditDisibility({super.key});

  @override
  State<EditDisibility> createState() => _EditDisibilityState();
}

class _EditDisibilityState extends State<EditDisibility> {
  AppController appController = Get.put(AppController());
  TextEditingController textEditingController = TextEditingController();

  bool change = false;

  @override
  void initState() {
    super.initState();
    if (appController.userModelLogins.isNotEmpty) {
      textEditingController.text =
          appController.userModelLogins.last.disibility!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const WidgetText(data: 'รายละเอียดความพิการด้านดวงตาและการมองเห็น'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetTitle(
                    title: 'รายละเอียดความพิการ\nด้านดวงตาและการมองเห็น'),
              ],
            ),
            Obx(() {
              return appController.userModelLogins.isEmpty
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetForm(
                          maxLine: 5,
                          textInputType: TextInputType.multiline,
                          textEditingController: textEditingController,
                          changeFunc: (p0) {
                            change = true;
                          },
                        ),
                      ],
                    );
            }),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetButton(
                    label: 'แก้ไข',
                    pressFunc: () {

                      
                      if (change) {
                        Map<String, dynamic> map =
                          appController.userModelLogins.last.toMap();
                      map['disibility'] = textEditingController.text;

                      AppService().editUserProfile(map: map).then((value) {
                        AppService().readUserModelLogin();
                        Get.back();
                        AppSnackBar(
                                context: context,
                                title: 'แก้ไข สำเร็จ',
                                message: 'แก้ไข รายละเอียดความพิการ สำเร็จ')
                            .normalSnackBar();
                      });
                      } else {
                        AppSnackBar(
                                context: context,
                                title: 'ไม่มีการเปลี่ยนแปลง',
                                message:
                                    'การแก้ไข ต้องพิมพ์เปลี่ยนแปลง รายละเอียด ก่อนคะ')
                            .errorSnackBar();
                      }
                    },
                    iconData: Icons.edit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
