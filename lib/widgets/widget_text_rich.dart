// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blindhelp/utility/app_constant.dart';

class WidgetTextRich extends StatelessWidget {
  const WidgetTextRich({
    Key? key,
    required this.title,
    required this.value,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final String value;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppConstant().titleStyle(context: context, color: titleColor),
        children: [
          TextSpan(text: value, style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
