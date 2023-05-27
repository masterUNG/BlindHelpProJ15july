import 'dart:io';

import 'package:blindhelp/models/user_model.dart';
import 'package:blindhelp/states/authen.dart';
import 'package:blindhelp/states/main_helper.dart';
import 'package:blindhelp/states/main_user.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/authen',
    page: () => const Authen(),
  ),
  GetPage(
    name: '/user',
    page: () => const MainUser(),
  ),
  GetPage(
    name: '/helper',
    page: () => const MainHelper(),
  ),
];

String? initialRoute;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var remember = preferences.getBool('remember');
    if (remember == null) {
      initialRoute = '/authen';
      runApp(const MyApp());
    } else {
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        print('event --> $event');
        if (event == null) {
          initialRoute = '/authen';
          runApp(const MyApp());
        } else {
          AppController appController = Get.put(AppController());
          appController.uidLogin.value = event.uid;
          await FirebaseFirestore.instance
              .collection('user')
              .doc(appController.uidLogin.value)
              .get()
              .then((value) {
            print('value --> ${value.data()}');
            UserModel userModel = UserModel.fromMap(value.data()!);
            appController.userModelLogins.add(userModel);
            if (appController.userModelLogins.last.typeUser ==
                AppConstant.typeUsers[0]) {
              initialRoute = '/user';
              runApp(const MyApp());
            } else if (appController.userModelLogins.last.typeUser ==
                AppConstant.typeUsers[1]) {
              initialRoute = '/helper';
              runApp(const MyApp());
            } else {
              initialRoute = '/authen';
              runApp(const MyApp());
            }
          });
        }
      });
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('initialRoute --> $initialRoute');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: initialRoute,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
