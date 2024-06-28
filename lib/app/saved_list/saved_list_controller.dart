import 'package:form/service/firebase_service.dart';
import 'package:get/get.dart';

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
    userList.value = await FirebaseService().getUserList();
  }
}
