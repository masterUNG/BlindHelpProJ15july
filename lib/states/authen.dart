import 'package:blindhelp/states/create_new_account.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_button_outline.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_logo_appname.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: CheckboxListTile(
                  value: false,
                  onChanged: (value) {},
                  title: WidgetText(
                    data: 'จดจำฉันไว้',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: WidgetTextButton(
                    label: 'ลืมรหัสผ่าน?',
                    pressFunc: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetButton(
                label: 'เข้าสู่ระบบ',
                pressFunc: () {},
                iconData: Icons.person_3_outlined,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetButtonOutline(
                label: 'ลงทะเบียน',
                pressFunc: () {
                  Get.to(const CreateNewAccount());
                },
                iconData: Icons.person_3_outlined,
              ),
            ],
          ),
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
