// ignore_for_file: avoid_print

import 'package:blindhelp/states/help_helper.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_circle_image_network.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUserHelp extends StatefulWidget {
  const ListUserHelp({super.key});

  @override
  State<ListUserHelp> createState() => _ListUserHelpState();
}

class _ListUserHelpState extends State<ListUserHelp> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readUser().then((value) {
       appController.load.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('lastmessage ---> ${appController.lastMessages.length}');
      return (appController.load.value || appController.userModelHelper.isEmpty) ||
              (appController.lastMessages.isEmpty)
          ? const SizedBox()
          : GridView.builder(
              itemCount: appController.userModelHelper.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4, crossAxisSpacing: 4, crossAxisCount: 3),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(HelpHelper(
                      userModel: appController.userModelHelper[index]));
                },
                child: Container(
                  decoration: AppConstant().borderBox(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appController.userModelHelper[index].urlAvatar!.isEmpty
                          ? WidgetText(
                              data: 'ไม่มีรูปภาพ',
                              textStyle: AppConstant().titleStyle(
                                context: context,
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            )
                          : WidgetCircleImageNetwork(
                              radius: 32,
                              urlImage: appController
                                  .userModelHelper[index].urlAvatar!),
                      WidgetText(
                        data: appController.userModelHelper[index].name,
                        textStyle: AppConstant().titleStyle(context: context),
                      ),
                      appController.lastMessages.isEmpty ? const SizedBox() : WidgetText(
                        data: appController.lastMessages[index],
                        textStyle: AppConstant().titleStyle(
                            context: context, fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
