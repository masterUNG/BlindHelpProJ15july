import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_image_file.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({super.key});

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();

  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'เพิ่มบทความ'),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: boxConstraints.maxHeight,
            child: ListView(
              children: [
                WidgetForm(
                  labelWidget: const WidgetText(data: 'ชื่อบทความ/ข่าวสาร'),
                  textEditingController: titleTextEditingController,
                ),
                const SizedBox(height: 16),
                WidgetText(
                  data: 'พิมข้อความของคุณ',
                  textStyle: AppConstant().titleStyle(context: context),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: boxConstraints.maxHeight * 0.35,
                  child: TextFormField(
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      WidgetButton(
                          label: 'อัพโหลดรูปภาพ',
                          pressFunc: () {
                            AppService()
                                .takePhoto(imageSource: ImageSource.gallery);
                          },
                          iconData: Icons.image),
                    ],
                  ),
                ),
                Obx(() {
                  return appController.files.isEmpty
                      ? const SizedBox()
                      : WidgetImageFile(file: appController.files.last);
                })
              ],
            ),
          ),
        );
      }),
      floatingActionButton: WidgetButton(
          label: 'บันทึกบทความ',
          pressFunc: () {
            if ((textEditingController.text.isEmpty) ||
                (titleTextEditingController.text.isEmpty)) {
              AppSnackBar(
                      context: context,
                      title: 'ชื่อ หรือ บทความยังไม่มี ?',
                      message: 'กรุณาพิมพ์ บทความก่อนคะ')
                  .errorSnackBar();
            } else {
              AppService()
                  .addNewArticle(
                      article: textEditingController.text,
                      title: titleTextEditingController.text)
                  .then((value) => Get.back());
            }
          },
          iconData: Icons.save),
    );
  }
}
