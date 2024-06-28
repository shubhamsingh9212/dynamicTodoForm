import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form/app/add_form_filelds/add_form_fields_controller.dart';
import 'package:form/common_widgets/custom_elevated_button.dart';
import 'package:form/common_widgets/custom_sizedbox.dart';
import 'package:form/common_widgets/custom_textfield.dart';
import 'package:form/constants/app_colors.dart';
import 'package:get/get.dart';

Widget addFormBody({
  double width = 20,
}) {
  AddFormFieldsController controller = Get.find<AddFormFieldsController>();
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 16,
    ),
    width: double.infinity,
    child: SingleChildScrollView(
      child: Form(
        key: controller.fieldsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customTextField(
              title: "Name",
              controller: controller.nameController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "User name required.";
                } else {
                  return null;
                }
              },
            ),
            customHeight(35),
            const Text(
              "Select Field Type",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            customHeight(8),
            dropDownButton(),
            customHeight(35),
            customTextField(
              title: "Field Title",
              controller: controller.fieldTitleController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field title required.";
                } else {
                  return null;
                }
              },
            ),
            customHeight(35),
            customTextField(
              title: "Placeholder",
              controller: controller.placeHolderController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field placeholder required.";
                } else {
                  return null;
                }
              },
            ),
            customHeight(35),
            customHeight(40),
            Center(
              child: customElevatedButton(
                onPressed: () {
                  if (controller.fieldsKey.currentState!.validate()) {
                    RxList<Map<String, dynamic>> formList =
                        controller.formController.formList;
                    bool isExist = false;
                    int index = 0;
                    for (int i = 0; i < formList.length; i++) {
                      if (formList[i]["user_name"] ==
                          controller.nameController.text.trim()) {
                        isExist = true;
                        index = i;
                        break;
                      }
                    }
                    if (!isExist) {
                      formList.add(
                        {
                          "user_name": controller.nameController.text.trim(),
                          "data": [
                            {
                              "field_title":
                                  controller.fieldTitleController.text.trim(),
                              "place_holder":
                                  controller.placeHolderController.text.trim(),
                              "field_type": controller.currentFiledType.value,
                            }
                          ]
                        },
                      );
                    } else if (isExist) {
                      formList[index]["data"].add(
                        {
                          "field_title":
                              controller.fieldTitleController.text.trim(),
                          "field_type": controller.currentFiledType.value,
                          "place_holder":
                              controller.placeHolderController.text.trim(),
                        },
                      );
                    }
                    log(controller.formController.formList.toString());
                    Fluttertoast.showToast(
                      msg: "Field Added!",
                      backgroundColor: AppColors.navyBlue,
                    );
                    controller.nameController.text = "";
                    controller.fieldTitleController.text = "";
                    Get.back();
                  }
                },
                label: "Submit",
                width: width,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget dropDownButton() {
  AddFormFieldsController controller = Get.find<AddFormFieldsController>();
  return InputDecorator(
    decoration: const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: AppColors.navyBlue,
        ),
      ),
    ),
    child: DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton<String>(
          value: controller.currentFiledType.value,
          isDense: true,
          isExpanded: true,
          items: List.generate(
            controller.dropDownList.length,
            (index) {
              return DropdownMenuItem(
                value: controller.dropDownList[index],
                child: Text(
                  controller.dropDownList[index],
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
          ),
          onChanged: (val) {
            controller.changeFieldType(val ?? "");
            log(val.toString());
          },
        ),
      ),
    ),
  );
}
