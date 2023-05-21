// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blindhelp/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.label,
    required this.pressFunc,
    required this.iconData,
  }) : super(key: key);

  final String label;
  final Function() pressFunc;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: ElevatedButton.icon(
        onPressed: pressFunc,
        icon: Icon(iconData),
        label: WidgetText(
          data: label,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
