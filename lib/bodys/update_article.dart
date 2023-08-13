import 'package:blindhelp/states/add_article.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateArticle extends StatefulWidget {
  const UpdateArticle({super.key});

  @override
  State<UpdateArticle> createState() => _UpdateArticleState();
}

class _UpdateArticleState extends State<UpdateArticle> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readMyArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return appController.articleModels.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: appController.articleModels.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 8,left: 8,right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: AppConstant().borderBox(),
                  child: WidgetText(
                      data: appController.articleModels[index].article),
                ),
              );
      }),
      floatingActionButton: WidgetButton(
          size: 180,
          label: 'เพิ่มบทความ',
          pressFunc: () {
            Get.to(const AddArticle())!.then((value) {
              AppService().readMyArticle();
            });
          },
          iconData: Icons.add_box),
    );
  }
}
