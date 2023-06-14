import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/widgets/widget_circle_image.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:blindhelp/widgets/widget_title.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: AppConstant().borderBox(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: const WidgetCircleImage(
              radius: 45,
            ),
          ),
          SizedBox(
            width: 218,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetTitle(title: 'ชื่อ-นามสกุล :'),
                Row(
                  children: [
                    Expanded(child: displayText(text: 'Name', color: Theme.of(context).primaryColor)),
                    Expanded(child: displayText(text: 'Surname', color: Theme.of(context).primaryColor)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child:   Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                       child: Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                       child: Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                       child: Row(
                        children: [
                          Expanded(child: WidgetText(data: 'data'),),
                          Expanded(child: displayText(text: 'text'),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayText({required String text, Color? color}) => WidgetText(
      data: text, textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: color));
}
