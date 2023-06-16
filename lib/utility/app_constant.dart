import 'package:flutter/material.dart';

class AppConstant {
  static final List<String> typeUsers = <String>[
    'คนพิการทางการมองเห็น',
    'อาสาสมัครสาธารณะสุขประจำหมู่บ้าน(อสม.)',
  ];

  BoxDecoration borderBox() => BoxDecoration(
      border: Border.all(), borderRadius: BorderRadius.circular(4));

  BoxDecoration gradientBox({required BuildContext context}) => BoxDecoration(
      gradient: RadialGradient(
          colors: <Color>[Colors.white, Theme.of(context).primaryColor],
          center: Alignment.topLeft,
          radius: 1.3));
}
