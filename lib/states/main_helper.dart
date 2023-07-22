// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blindhelp/bodys/check_drug_label.dart';
import 'package:blindhelp/bodys/list_user_help.dart';
import 'package:blindhelp/bodys/home_helper.dart';
import 'package:blindhelp/bodys/update_article.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_header_drawer.dart';
import 'package:blindhelp/widgets/widget_signout.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHelper extends StatefulWidget {
  const MainHelper({super.key});

  @override
  State<MainHelper> createState() => _MainHelperState();
}

class _MainHelperState extends State<MainHelper> {
  var bodys = <Widget>[
    const HomeHelper(),
    const CheckDrugLabel(),
    const ListUserHelp(),
    const UpdateArticle(),
  ];

  var titles = <String>[
    'หน้าแรก',
    'ตรวจฉลากยา',
    'ช่วยเหลือ',
    'อัพเดทบทความ',
  ];

  var icons = <IconData>[
    Icons.home,
    Icons.menu_book,
    Icons.live_help,
    Icons.article,
  ];

  var items = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    AppService().readUserModelLogin();
    AppService().readUser();

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
              title: WidgetText(data: titles[appController.indexBody.value]),
            ),
            endDrawer: const Drawer(
              child: Column(
                children: [
                  WidgetHeaderDrawer(),
                  Spacer(),
                  WidgetSignOut(),
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
                // appController.load.value = true;
              },
            ),
          );
        });
  }
}
