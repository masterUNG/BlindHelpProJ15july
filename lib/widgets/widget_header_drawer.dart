import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/widgets/widget_image_asset.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetHeaderDrawer extends StatefulWidget {
  const WidgetHeaderDrawer({
    super.key,
  });

  @override
  State<WidgetHeaderDrawer> createState() => _WidgetHeaderDrawerState();
}

class _WidgetHeaderDrawerState extends State<WidgetHeaderDrawer> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: WidgetText(
        data: appController.userModelLogins.last.name,
        textStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white),
      ),
      accountEmail:
          WidgetText(data: appController.userModelLogins.last.typeUser),
          currentAccountPicture: const WidgetImageAsset(),
          currentAccountPictureSize: const Size.square(60),
          decoration: AppConstant().gradientBox(context: context),
    );
  }
}
