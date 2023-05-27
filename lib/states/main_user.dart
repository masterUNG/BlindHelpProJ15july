import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_icon_button.dart';
import 'package:blindhelp/widgets/widget_signout.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class MainUser extends StatelessWidget {
  const MainUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(data: AppConstant.typeUsers[0]),
        actions: [
          WidgetSignOut()
        ],
      ),
    );
  }
}
