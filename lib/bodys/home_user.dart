import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_circle_image.dart';
import 'package:blindhelp/widgets/widget_circle_image_network.dart';
import 'package:blindhelp/widgets/widget_emergency_call.dart';
import 'package:blindhelp/widgets/widget_map.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_text_rich.dart';
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
                                      size: 12,
                                      color: Colors.white,
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
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      height: 150,
                      margin: const EdgeInsets.only(left: 4, right: 8),
                      decoration: AppConstant().borderBox(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WidgetTitle(
                            title: 'รายละเอียดความพิการด้านดวงตาและการมองเห็น',
                            size: 13,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration:
                                  AppConstant().curveBox(context: context),
                              child: appController.userModelLogins.isEmpty
                                  ? const SizedBox()
                                  : ListView(
                                      children: [
                                        WidgetTitle(
                                          title: appController.userModelLogins
                                                  .last.disibility ??
                                              '-',
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: AppConstant().borderBox(),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const WidgetTitle(
                          title: 'ยาประจำตัว',
                          size: 13,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: AppConstant().curveBox(context: context),
                          child: const Row(
                            children: [
                              Expanded(
                                child: WidgetTitle(
                                  title: 'ชื่อยา',
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: WidgetTitle(
                                  title: 'จำนวนครั้งใช้ยา',
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    appController.medicieneModels.isEmpty
                        ? const SizedBox()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      appController.medicieneModels.length,
                                  itemBuilder: (context, index) => Row(
                                    children: [
                                      Expanded(
                                        child: WidgetText(
                                            data: appController
                                                .medicieneModels[index]
                                                .nameMedicene),
                                      ),
                                      Expanded(
                                        child: WidgetText(
                                            data: appController
                                                .medicieneModels[index]
                                                .amountMedicene),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      margin: const EdgeInsets.only(left: 8, right: 4),
                      decoration: AppConstant().borderBox(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: AppConstant().borderBox(),
                            child: const WidgetMap(),
                          ),
                          const WidgetTitle(
                            title:
                                'โรงพยาบาลศูนย์การแพทย์มหาวิทยาลัยแม่ฟ้าหลวง',
                            size: 13,
                          ),
                          WidgetTextRich(
                            title: 'เบอร์ติดต่อ :',
                            titleStyle: Theme.of(context).textTheme.bodySmall,
                            value: ' 095-674-4565',
                            valueStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      margin: const EdgeInsets.only(left: 4, right: 8),
                      decoration: AppConstant().borderBox(),
                      child: const Column(
                        children: [
                          WidgetTitle(
                            title: 'ช่องทางติดต่อฉุกเฉิน : ',
                            size: 13,
                          ),
                          WidgetEmergencyCall(),
                        ],
                      ),
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
