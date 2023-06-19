import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_circle_image.dart';
import 'package:blindhelp/widgets/widget_circle_image_network.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          return ListView(
            children: [
              displayProfile(appController, context),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 150,
                      margin: const EdgeInsets.only(left: 8, right: 4),
                      decoration: AppConstant().borderBox(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WidgetTitle(
                            title: 'โรคประจำตัว:',
                            size: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            width: double.infinity,
                            height: 45,
                            decoration:
                                AppConstant().curveBox(context: context),
                            child: appController.userDiseaseModels.isEmpty
                                ? const WidgetTitle(
                                    title: '-',
                                    size: 12,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        appController.userDiseaseModels.length,
                                    itemBuilder: (context, index) =>
                                        WidgetTitle(
                                      title: appController
                                          .userDiseaseModels[index].disease,
                                      size: 12,color: Colors.white,
                                    ),
                                  ),
                          ),
                          const WidgetTitle(
                            title: 'ประวัติการแพ้ยา :',
                            size: 13,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            width: double.infinity,
                            height: 45,
                            decoration:
                                AppConstant().curveBox(context: context),
                            child: appController.historyDrugModels.isEmpty
                                ? const WidgetTitle(
                                    title: '-',
                                    size: 12,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        appController.historyDrugModels.length,
                                    itemBuilder: (context, index) =>
                                        WidgetTitle(
                                      title: appController
                                          .historyDrugModels[index].historyDrug,
                                      size: 12,color: Colors.white,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 150,
                      margin: const EdgeInsets.only(left: 4, right: 8),
                      decoration: AppConstant().borderBox(),
                      child: const WidgetTitle(
                        title: 'รายละเอียดความพิการด้านดวงตาและการมองเห็น',
                        size: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: AppConstant().borderBox(),
                child: const Text('data'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 150,
                      margin: const EdgeInsets.only(left: 8, right: 4),
                      decoration: AppConstant().borderBox(),
                      child: const Text('data'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 150,
                      margin: const EdgeInsets.only(left: 4, right: 8),
                      decoration: AppConstant().borderBox(),
                      child: const Text('data'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              )
            ],
          );
        });
  }

  Widget displayProfile(AppController appController, BuildContext context) {
    return appController.userModelLogins.isEmpty
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: AppConstant().borderBox(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: appController.userModelLogins.last.urlAvatar!.isEmpty
                      ? const WidgetCircleImage(
                          radius: 45,
                        )
                      : WidgetCircleImageNetwork(
                          urlImage:
                              appController.userModelLogins.last.urlAvatar!,
                          radius: 45,
                        ),
                ),
                SizedBox(
                  width: 218,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WidgetTitle(title: 'ชื่อ-นามสกุล:'),
                      Row(
                        children: [
                          Expanded(
                              child: displayText(
                                  text: appController.userModelLogins.last.name,
                                  color: Theme.of(context).primaryColor)),
                          Expanded(
                              child: displayText(
                                  text: appController
                                      .userModelLogins.last.surName,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    data: 'กรุ๊ปเลือด:',
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: displayText(
                                      text: appController
                                          .userModelLogins.last.bloodTyoe!),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    data: 'เพศ:',
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: displayText(
                                      text: appController
                                          .userModelLogins.last.gender!),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    data: 'อายุ:',
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: displayText(
                                      text: appController
                                          .userModelLogins.last.age!),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                WidgetText(
                                  data: 'วันเดือนปีเกิด:',
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                ),
                                displayText(
                                    text: appController
                                                .userModelLogins.last.birth ==
                                            Timestamp(0, 0)
                                        ? '???'
                                        : AppService().timeStampToString(
                                            timestamp: appController
                                                .userModelLogins.last.birth!)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    data: 'น้ำหนัก:',
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: displayText(
                                      text: appController
                                          .userModelLogins.last.weight!),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    data: 'ส่วนสูง:',
                                    textStyle:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  child: displayText(
                                      text: appController
                                          .userModelLogins.last.height!),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget displayText({required String text, Color? color, double? size}) =>
      WidgetText(
          data: text,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: color, fontSize: size));
}
