import 'package:form/app/saved_list/saved_list_controller.dart';
import 'package:get/get.dart';

class SavedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedListController>(
      () => SavedListController(),
    );
  }
}
