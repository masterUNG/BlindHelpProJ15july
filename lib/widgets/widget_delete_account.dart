import 'package:blindhelp/utility/app_dialog.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetDeleteAccount extends StatelessWidget {
  const WidgetDeleteAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      label: 'ลบข้อมูล',
      pressFunc: () {
        AppDialog(context: context).normalDialog(
            tilte: 'ลบข้อมูล',
            contentWidget: const WidgetText(
                data:
                    'คุณแน่ใจที่จะ ลบข้อมูล ทั้งหมด ของคุณนะ ถ้าต้องการ ให้คลิกยืนยัน คะ'),
            firstAction: WidgetButton(
                label: 'ยืนยัน', pressFunc: () {}, iconData: Icons.delete_forever, size: 110, color: Colors.red.shade700,));
      },
      iconData: Icons.delete_forever,
      color: Colors.red.shade700,
    );
  }
}
