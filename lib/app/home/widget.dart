import 'package:flutter/material.dart';
import 'package:form/common_widgets/custom_elevated_button.dart';
import 'package:form/routes/app_pages.dart';
import 'package:get/get.dart';

Widget homeBody({
  double width = 20,
}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customElevatedButton(
          onPressed: () => Get.toNamed(Routes.FORM),
          width: width,
        ),
        const SizedBox(
          height: 25,
        ),
        customElevatedButton(
          onPressed: () => Get.toNamed(Routes.SAVEDLISTFORM),
          label: "List Saved Forms",
          width: width,
        ),
      ],
    ),
  );
}
