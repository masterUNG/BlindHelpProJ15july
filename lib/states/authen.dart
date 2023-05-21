import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_logo_appname.dart';
import 'package:flutter/material.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          showHeader(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                hint: 'ชื่อผู้ใช้หรืออีเมล',
                prefixWidget: Icon(Icons.person_3_outlined),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                hint: 'รหัสผ่านหรือพาสเวิร์ด',
                prefixWidget: Icon(Icons.lock_outline),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetButton(
                label: 'เข้าสู่ระบบ',
                pressFunc: () {},
                iconData: Icons.person_3_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }

  Row showHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: 250,
          child: const WidgetLogoAppName(),
        ),
      ],
    );
  }
}
