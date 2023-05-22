// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.prefixWidget,
    this.subfixWidget,
    this.textEditingController,
    this.labelWidget,
    this.marginBottom,
  }) : super(key: key);

  final String? hint;
  final Widget? prefixWidget;
  final Widget? subfixWidget;
  final TextEditingController? textEditingController;
  final Widget? labelWidget;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      margin:  EdgeInsets.only(top: 16, bottom: marginBottom ?? 0.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: labelWidget,
          hintText: hint,
          prefixIcon: prefixWidget,
          suffixIcon: subfixWidget,
          filled: true,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        ),
      ),
    );
  }
}
