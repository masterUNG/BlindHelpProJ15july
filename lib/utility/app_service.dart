import 'dart:convert';

import 'package:blindhelp/models/name_th_model.dart';
import 'package:blindhelp/utility/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppService {
  AppController appController = Get.put(AppController());

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
