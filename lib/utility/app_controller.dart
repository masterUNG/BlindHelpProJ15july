import 'package:blindhelp/models/name_th_model.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:get/get.dart';

class AppController extends GetxController {

  RxString typeUser = AppConstant.typeUsers[0].obs;
  RxList<NameThModel> provinceNameThModels = <NameThModel>[].obs;
  RxList<NameThModel?> chooseProviceModels = <NameThModel?>[null].obs;
}
