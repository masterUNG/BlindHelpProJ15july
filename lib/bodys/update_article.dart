import 'package:blindhelp/states/add_article.dart';
import 'package:blindhelp/states/edit_article.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_image_network.dart';
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
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return Obx(() {
          return appController.articleModels.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemCount: appController.articleModels.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: AppConstant().borderBox(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: boxConstraints.maxWidth * 0.6,
                              child: WidgetText(
                                data: appController.articleModels[index].title,
                                textStyle:
                                    AppConstant().titleStyle(context: context),
                              ),
                            ),
                            appController.articleModels[index].urlImage.isEmpty
                                ? const SizedBox()
                                : SizedBox(
                                    width: boxConstraints.maxWidth * 0.6,
                                    child: WidgetImageNewwork(
                                        url: appController
                                            .articleModels[index].urlImage),
                                  ),
                            SizedBox(
                              width: boxConstraints.maxWidth * 0.6,
                              child: WidgetText(
                                  data: appController
                                      .articleModels[index].article),
                            ),
                          ],
                        ),
                        WidgetButton(
                          label: 'แก้ไข',
                          pressFunc: () {
                            Get.to(EditArticle(
                              articleModel: appController.articleModels[index],
                              docIdArticle: appController.docIdArticles[index],
                            ))!
                                .then((value) => AppService().readMyArticle());
                          },
                          iconData: Icons.edit,
                          size: 110,
                        )
                      ],
                    ),
                  ),
                );
        });
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
