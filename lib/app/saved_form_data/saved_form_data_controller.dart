import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_data_model.dart';

class SavedFormDataController extends GetxController {
  UserData userData = Get.arguments;
  GlobalKey<FormState> userFormKey = GlobalKey();
  RxBool isValidationChecked = false.obs;

  String? validateEmail({
    String? value,
    required String fieldTitle,
  }) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    return (value == null || value.isEmpty)
        ? "Please Enter $fieldTitle."
        : (value.length > 40)
            ? "Maximum 40 Character."
            : (!regex.hasMatch(value.trim()))
                ? "Please Enter Valid $fieldTitle."
                : null;
  }

  String? validatePassword({
    String? value,
    required String fieldTitle,
  }) {
    const pattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,40}$";
    final regex = RegExp(pattern);

    return (value == null || value.isEmpty)
        ? "Please Enter $fieldTitle."
        : (value.length < 6)
            ? "Min 6 characters required."
            : (value.length > 40)
                ? "Max 40 characters allowed ."
                : (!regex.hasMatch(value.trim()))
                    ? "Data invalid."
                    : null;
  }

  String? fieldValidation({
    required String fieldType,
    required String fieldTitle,
    String? val,
  }) {
    if (isValidationChecked.value) {
      if (fieldType == "Email") {
        return validateEmail(
          value: val,
          fieldTitle: fieldTitle,
        );
      } else if (fieldType == "Password") {
        return validatePassword(
          value: val,
          fieldTitle: fieldTitle,
        );
      } else if (val == null || val.trim() == "") {
        return "$fieldTitle Required.";
      } else {
        return null;
      }
    }
  }
}
