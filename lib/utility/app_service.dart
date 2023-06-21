import 'dart:convert';
import 'dart:io';

import 'package:blindhelp/models/disease_model.dart';
import 'package:blindhelp/models/hitory_drug_model.dart';
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

  Future<void> editUserProfile({required Map<String, dynamic> map}) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(appController.userModelLogins.last.uid)
        .update(map);
  }

  Future<void> readDisease({String? docIdUserOwnerDisease}) async {
    String docIdUser =
        docIdUserOwnerDisease ?? appController.userModelLogins.last.uid;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(docIdUser)
        .collection('disease')
        .orderBy('timestamp')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        if (appController.userDiseaseModels.isNotEmpty) {
          appController.userDiseaseModels.clear();
        }

        for (var element in value.docs) {
          DiseaseModel diseaseModel = DiseaseModel.fromMap(element.data());
          appController.userDiseaseModels.add(diseaseModel);
        }
      }
    });
  }

  Future<void> readHistoryDrug({String? docIdUserHistoryDrug}) async {
    String docIdUser =
        docIdUserHistoryDrug ?? appController.userModelLogins.last.uid;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(docIdUser)
        .collection('historyDrug')
        .orderBy('timestamp')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        if (appController.historyDrugModels.isNotEmpty) {
          appController.historyDrugModels.clear();
        }

        for (var element in value.docs) {
          HistoryDrugModel historyDrugModel =
              HistoryDrugModel.fromMap(element.data());
          appController.historyDrugModels.add(historyDrugModel);
        }
      }
    });
  }

  Future<void> addDisease({required DiseaseModel diseaseModel}) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(appController.userModelLogins.last.uid)
        .collection('disease')
        .doc()
        .set(diseaseModel.toMap());
  }

  Future<void> addHistoryDrug(
      {required HistoryDrugModel historyDrugModel}) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(appController.userModelLogins.last.uid)
        .collection('historyDrug')
        .doc()
        .set(historyDrugModel.toMap());
  }

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
