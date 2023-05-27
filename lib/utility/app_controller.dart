import 'package:blindhelp/models/name_th_model.dart';
import 'package:blindhelp/models/user_model.dart';
import 'package:blindhelp/utility/app_constant.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxString typeUser = AppConstant.typeUsers[0].obs;
  RxList<NameThModel> provinceNameThModels = <NameThModel>[].obs;
  RxList<NameThModel?> chooseProviceModels = <NameThModel?>[null].obs;
  RxList<NameThModel> amphurNameThModels = <NameThModel>[].obs;
  RxList<NameThModel?> chooseAmphurModels = <NameThModel?>[null].obs;
  RxList<NameThModel> districeNameThModels = <NameThModel>[].obs;
  RxList<NameThModel?> chooseDistriceModels = <NameThModel?>[null].obs;
  RxBool accept = false.obs;
  RxBool remember = false.obs;

  RxString uidLogin = ''.obs;
  RxList<UserModel> userModelLogins = <UserModel>[].obs;
}
