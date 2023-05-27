// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_signout.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class MainHelper extends StatelessWidget {
  const MainHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(data: AppConstant.typeUsers[1]),
        actions: [ const WidgetSignOut()],
      ),
    );
  }
}
