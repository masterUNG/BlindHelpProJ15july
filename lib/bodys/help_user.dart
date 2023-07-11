import 'package:blindhelp/models/chat_model.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:blindhelp/utility/app_service.dart';
import 'package:blindhelp/widgets/widget_button.dart';
import 'package:blindhelp/widgets/widget_form.dart';
import 'package:blindhelp/widgets/widget_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpUser extends StatefulWidget {
  const HelpUser({super.key});

  @override
  State<HelpUser> createState() => _HelpUserState();
}

class _HelpUserState extends State<HelpUser> {
  TextEditingController textEditingController = TextEditingController();
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxWidth - 60,
            child: const WidgetText(data: 'HelpUser'),
          ),
        );
      }),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetForm(
              textEditingController: textEditingController,
              marginTop: 0,
              hint: 'ข้อความ',
            ),
            WidgetButton(
              size: 100,
              label: 'ส่ง',
              pressFunc: () {
                ChatModel chatModel = ChatModel(
                    message: textEditingController.text,
                    nameSender: appController.userModelLogins.last.name,
                    uidSender: appController.userModelLogins.last.uid,
                    urlSender:
                        appController.userModelLogins.last.urlAvatar ?? '',
                    timestamp: Timestamp.fromDate(DateTime.now()));
                print('chatModel --> ${chatModel.toMap()}');
                AppService()
                    .addChat(map: chatModel.toMap())
                    .then((value) => textEditingController.text = '');
              },
              iconData: Icons.send,
            ),
          ],
        ),
      ),
    );
  }
}
