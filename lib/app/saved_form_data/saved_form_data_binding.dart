import 'package:form/app/saved_form_data/saved_form_data_controller.dart';
import 'package:get/get.dart';

class SavedFormDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedFormDataController>(
      () => SavedFormDataController(),
    );
  }
}
