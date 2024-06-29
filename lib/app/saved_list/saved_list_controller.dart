import 'package:form/common_widgets/custom_loader.dart';
import 'package:form/service/firebase_service.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_toast.dart';
import '../../models/user_data_model.dart';

class SavedListController extends GetxController {
  RxList<String> userList = <String>[].obs;
  Rx<UserData> userData = UserData().obs;
  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      loader();
      userList.value = await FirebaseService().getUserList();
      Get.back();
    } catch (e) {
      Get.back();
      customToast(msg: "Please check your internet connection.");
    }
  }
}
