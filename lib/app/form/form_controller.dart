import 'package:form/app/saved_list/saved_list_controller.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_loader.dart';
import '../../common_widgets/custom_toast.dart';
import '../../routes/app_pages.dart';
import '../../service/firebase_service.dart';

class FormController extends GetxController {
  SavedListController savedListController = Get.find<SavedListController>();
  List<Map<String, dynamic>> formList = <Map<String, dynamic>>[];

  Future<void> saveData() async {
    if (formList.isEmpty) {
      customToast(msg: "Please enter some fields!");
    } else {
      try {
        loader();
        List<Map<String, dynamic>> list = formList;
        await FirebaseService().addData(list);
        savedListController.userList.value =
            await FirebaseService().getUserList();
        Get.back();
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        customToast(msg: "Please check your internet connection.");
        Get.back();
      }
    }
  }
  void updateList(){
    update();
  }
}
