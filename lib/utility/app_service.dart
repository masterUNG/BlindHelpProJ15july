import 'dart:convert';
import 'dart:io';

import 'package:blindhelp/models/name_th_model.dart';
import 'package:blindhelp/models/user_model.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<String?> uploadImage({required String path}) async {
    String? urlImage;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference =
        firebaseStorage.ref().child('$path/${appController.nameFiles.last}');

    UploadTask uploadTask = reference.putFile(appController.files.last);
    await uploadTask.whenComplete(() async {
      urlImage = await reference.getDownloadURL();
    });

    return urlImage;
  }

  Future<void> takePhoto({required ImageSource imageSource}) async {
    var result = await ImagePicker()
        .pickImage(source: imageSource, maxWidth: 800, maxHeight: 800);

    if (result != null) {
      appController.files.add(File(result.path));
      appController.nameFiles.add(basename(result.path));
    }
  }

  String timeStampToString({required Timestamp timestamp}) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String string = dateFormat.format(timestamp.toDate());
    return string;
  }

  Future<void> readUserModelLogin() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      UserModel userModel = UserModel.fromMap(value.data()!);
      appController.userModelLogins.add(userModel);
    });
  }

  Future<void> updateUser({required Map<String, dynamic> data}) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('user')
        .doc(appController.userModelLogins.last.uid);

    documentReference.update(data);
  }

  Future<void> readDistrice({required String idAmphur}) async {
    if (appController.districeNameThModels.isNotEmpty) {
      appController.districeNameThModels.clear();
      appController.chooseDistriceModels.clear();
      appController.chooseDistriceModels.add(null);
    }

    String urlApi =
        'https://www.androidthai.in.th/flutter/getDistriceByAmphure.php?isAdd=true&amphure_id=$idAmphur';
    await Dio().get(urlApi).then((value) {
      for (var element in json.decode(value.data)) {
        NameThModel model = NameThModel.fromMap(element);
        appController.districeNameThModels.add(model);
      }
    });
  }

  Future<void> readAmphur({required String idProvince}) async {
    if (appController.amphurNameThModels.isNotEmpty) {
      appController.amphurNameThModels.clear();
      appController.chooseAmphurModels.clear();
      appController.chooseAmphurModels.add(null);
    }

    String urlApi =
        'https://www.androidthai.in.th/flutter/getAmpByProvince.php?isAdd=true&province_id=$idProvince';
    await Dio().get(urlApi).then((value) {
      for (var element in json.decode(value.data)) {
        NameThModel model = NameThModel.fromMap(element);
        appController.amphurNameThModels.add(model);
      }
    });
  }

  Future<void> readProvince() async {
    String urlApi = 'https://www.androidthai.in.th/flutter/getAllprovinces.php';
    await Dio().get(urlApi).then((value) {
      for (var element in json.decode(value.data)) {
        NameThModel provicneNameThModel = NameThModel.fromMap(element);
        appController.provinceNameThModels.add(provicneNameThModel);
      }
    });
  }
}
