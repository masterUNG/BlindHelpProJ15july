import 'package:blindhelp/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: WidgetText(data: 'scan')),);
  }
}