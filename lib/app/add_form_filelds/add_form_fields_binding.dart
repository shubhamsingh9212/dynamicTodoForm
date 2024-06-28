import 'package:get/get.dart';
import 'add_form_fields_controller.dart';

class AddFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFormFieldsController>(
      () => AddFormFieldsController(),
    );
  }
}
