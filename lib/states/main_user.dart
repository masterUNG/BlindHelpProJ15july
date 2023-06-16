import 'package:blindhelp/bodys/emergency_user.dart';
import 'package:blindhelp/bodys/help_user.dart';
import 'package:blindhelp/bodys/home_user.dart';
import 'package:blindhelp/bodys/read_drug_lable.dart';
import 'package:blindhelp/states/edit_profile_user.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_header_drawer.dart';
import 'package:blindhelp/widgets/widget_menu.dart';
import 'package:blindhelp/widgets/widget_signout.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainUser extends StatefulWidget {
  const MainUser({super.key});

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  var titles = <String>[
    'หน้าแรก',
    'โทรฉุกเฉิน',
    'อ่านฉลากยา',
    'ช่วยเหลือ',
  ];

  var appBarTitles = <String>[
    'ข้อมูลสุขภาพ',
    'ติดต่อโรงพยาบาล',
    'อ่านฉลากยา',
    'ความช่วยเหลือ',
  ];

  var bodys = <Widget>[
    const HomeUser(),
    const EmergencyUser(),
    const ReadDrugLabel(),
    const HelpUser(),
  ];

  var icons = <IconData>[
    Icons.home,
    Icons.phone,
    Icons.menu_book,
    Icons.live_help,
  ];

  var items = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();

    AppService().readUserModelLogin();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          return Scaffold(
            appBar: AppBar(
              title:
                  WidgetText(data: appBarTitles[appController.indexBody.value]),
              // actions: const [WidgetSignOut()],
            ),
            endDrawer: Drawer(
              child: Column(
                children: [
                  const WidgetHeaderDrawer(),
                  WidgetMemu(
                    leadWidget: const Icon(Icons.person),
                    titleWidget: const WidgetText(data: 'แก้ไขข้อมูล'),
                    tapFunc: () {
                      Get.back();
                      Get.to(const EditProfileUser())!.then((value) => null);
                    },
                  ),
                  const WidgetSignOut(),
                ],
              ),
            ),
            body: bodys[appController.indexBody.value],
            bottomNavigationBar: BottomNavigationBar(
              items: items,
              currentIndex: appController.indexBody.value,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.blue.shade300,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                appController.indexBody.value = value;
              },
            ),
          );
        });
  }
}
