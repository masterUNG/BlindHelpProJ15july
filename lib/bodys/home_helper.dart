import 'package:blindhelp/states/list_all_user.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHelper extends StatefulWidget {
  const HomeHelper({super.key});

  @override
  State<HomeHelper> createState() => _HomeHelperState();
}

class _HomeHelperState extends State<HomeHelper> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().readCheckHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SizedBox(
          width: double.infinity,
          height: boxConstraints.maxHeight,
          child: ListView(
            children: [
              WidgetText(
                data: 'รายการผู้ป่วยที่ตรวจเยี่ยมบ้าน',
                textStyle: AppConstant().titleStyle(context: context),
              ),
              Divider(color: Colors.black),
              Obx(() {
                return appController.checkHomeUsers.isEmpty
                    ? const SizedBox()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: appController.checkHomeUsers.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: WidgetText(
                                    data: (index + 1).toString(),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: WidgetText(
                                    data:
                                        '${appController.checkHomeUsers[index].mapUser['name']} ${appController.checkHomeUsers[index].mapUser['surName']}',
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      WidgetButton(
                                          size: 120,
                                          label: 'ดูข้อมูล',
                                          pressFunc: () {},
                                          iconData: Icons.info),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      );
              }),
            ],
          ),
        );
      }),
      floatingActionButton: WidgetButton(
          size: 150,
          label: 'เพิ่มรายการ',
          pressFunc: () {
            Get.to(const ListAllUser())!.then((value) => AppService().readCheckHome());
          },
          iconData: Icons.add_box),
    );
  }
}
