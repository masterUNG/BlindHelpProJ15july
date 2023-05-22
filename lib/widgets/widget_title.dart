import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return WidgetText(
      data: title,
      textStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
