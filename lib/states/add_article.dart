import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/utility/app_snackbar.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({super.key});

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  TextEditingController textEditingController = TextEditingController();

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
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: boxConstraints.maxHeight * 0.75,
                  child: TextFormField(
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), filled: true),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: WidgetButton(
          label: 'บันทึกบทความ',
          pressFunc: () {
            if (textEditingController.text.isEmpty) {
              AppSnackBar(
                      context: context,
                      title: 'บทความยังไม่มี ?',
                      message: 'กรุณาพิมพ์ บทความก่อนคะ')
                  .errorSnackBar();
            } else {
              AppService().addNewArticle(article: textEditingController.text).then((value) => Get.back());
            }
          },
          iconData: Icons.save),
    );
  }
}
