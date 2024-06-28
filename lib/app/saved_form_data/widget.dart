import 'package:flutter/material.dart';
import 'package:form/app/saved_form_data/saved_form_data_controller.dart';
import 'package:form/common_widgets/custom_elevated_button.dart';
import 'package:form/common_widgets/custom_sizedbox.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_textfield.dart';
import '../../models/user_data_model.dart';

Widget savedFormDataBody({
  double width = 20,
}) {
  SavedFormDataController controller = Get.find<SavedFormDataController>();
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    width: double.infinity,
    child: SingleChildScrollView(
      child: Form(
        key: controller.userFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.userData.data?.length,
              itemBuilder: (context, index) {
                Datum? fields = controller.userData.data?[index];
                return Column(
                  children: [
                    customTextField(
                      hintText: fields?.placeHolder ?? "",
                      keyboardType: fields?.fieldType == "Number"
                          ? TextInputType.number
                          : null,
                      title: fields?.fieldTitle ?? "",
                      controller: fields?.controller ?? TextEditingController(),
                      validator: (val) {
                        return controller.fieldValidation(
                          fieldType: fields?.fieldType ?? "",
                          fieldTitle: fields?.fieldTitle ?? "",
                        );
                      },
                    ),
                    customHeight(35),
                  ],
                );
              },
            ),
            customElevatedButton(
              onPressed: () {
                if (controller.userFormKey.currentState!.validate()) {}
              },
              label: "Check Validation",
              width: width,
            ),
          ],
        ),
      ),
    ),
  );
}
