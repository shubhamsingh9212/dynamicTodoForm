import 'package:form/app/saved_list/saved_list_controller.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  SavedListController savedListController = Get.find<SavedListController>();
  RxList<Map<String, dynamic>> formList = <Map<String, dynamic>>[].obs;
}
