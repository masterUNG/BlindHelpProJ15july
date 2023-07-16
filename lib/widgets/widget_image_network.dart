// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageNewwork extends StatelessWidget {
  const WidgetImageNewwork({
    Key? key,
    required this.url,
    this.boxFit,
    this.width,
    this.height,
  }) : super(key: key);

  final String url;
  final BoxFit? boxFit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: boxFit,width: width,height: height,
    );
  }
}
