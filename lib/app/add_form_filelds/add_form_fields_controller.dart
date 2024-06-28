import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:get/get.dart';

class AddFormFieldsController extends GetxController {
  GlobalKey<FormState> fieldsKey = GlobalKey();
  FormController formController = Get.find<FormController>();
  late TextEditingController nameController;
  late TextEditingController fieldTitleController;
  late TextEditingController placeHolderController;
  List<String> dropDownList = ["Text", "Number", "Email", "Password"];
  RxString currentFiledType = "Text".obs;
  void changeFieldType(String val) {
    currentFiledType.value = val;
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    placeHolderController = TextEditingController();
    fieldTitleController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    placeHolderController.dispose();
    fieldTitleController.dispose();
  }
}
