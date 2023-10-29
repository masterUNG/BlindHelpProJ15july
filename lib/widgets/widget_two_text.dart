import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetTwoText extends StatelessWidget {
  const WidgetTwoText({
    super.key,
    required this.head,
    required this.value,
  });

  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: WidgetText(data: head, textStyle: AppConstant().titleStyle(context: context),),
        ),
        Expanded(
          flex: 1,
          child: WidgetText(data: value),
        ),
      ],
    );
  }
}
