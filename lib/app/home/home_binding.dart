import 'package:form/app/home/home_controller.dart';
import 'package:get/get.dart';

import '../saved_list/saved_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
    Get.put<SavedListController>(
      SavedListController(),
    );
  }
}
