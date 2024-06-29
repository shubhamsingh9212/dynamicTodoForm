import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:form/common_widgets/custom_toast.dart';
import 'package:get/get.dart';

class AddFormFieldsController extends GetxController {
  GlobalKey<FormState> fieldsKey = GlobalKey();
  RxBool isValidationChecked = false.obs;
  FormController formController = Get.find<FormController>();
  late TextEditingController nameController;
  late TextEditingController fieldTitleController;
  late TextEditingController placeHolderController;
  List<String> dropDownList = ["Text", "Number", "Email", "Password"];
  RxString currentFiledType = "Text".obs;
  void changeFieldType(String val) {
    currentFiledType.value = val;
  }

  void onSubmit() {
    isValidationChecked.value = true;
    if (fieldsKey.currentState!.validate()) {
      List<Map<String, dynamic>> formList = formController.formList;
      bool isExist = false;
      int index = 0;
      for (int i = 0; i < formList.length; i++) {
        if (formList[i]["user_name"] == nameController.text.trim()) {
          isExist = true;
          index = i;
          break;
        }
      }
      if (!isExist) {
        formList.add(
          {
            "user_name": nameController.text.trim(),
            "data": [
              {
                "field_title": fieldTitleController.text.trim(),
                "place_holder": placeHolderController.text.trim(),
                "field_type": currentFiledType.value,
              }
            ]
          },
        );
      } else if (isExist) {
        formList[index]["data"].add(
          {
            "field_title": fieldTitleController.text.trim(),
            "field_type": currentFiledType.value,
            "place_holder": placeHolderController.text.trim(),
          },
        );
      }
      log(formController.formList.toString());
      customToast(
        msg: "Field Added!",
      );
      formController.updateList();
      nameController.text = "";
      fieldTitleController.text = "";
      Get.back();
    }
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
