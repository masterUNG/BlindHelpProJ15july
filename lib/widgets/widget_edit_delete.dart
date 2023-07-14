import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetEditDelete extends StatelessWidget {
  final Function() editFunc;
  final Function() deleteFunc;

  const WidgetEditDelete({
    Key? key,
    required this.editFunc,
    required this.deleteFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: editFunc,
          child: Container(
            width: 48,
            padding: const EdgeInsets.all(4),
            decoration: AppConstant().borderBox(),
            child:  const Column(
              children: [
                Icon(
                  Icons.edit,
                  size: 18,
                ),
                WidgetText(data: 'แก้ไข'),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: deleteFunc,
          child: Container(
            width: 48,
            padding: const EdgeInsets.all(4),
            decoration: AppConstant().borderBox(),
            child: const Column(
              children: [
                Icon(
                  Icons.delete,
                  size: 18,
                ),
                WidgetText(data: 'ลบ'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
