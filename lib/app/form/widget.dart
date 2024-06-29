import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:form/common_widgets/custom_card.dart';
import 'package:form/common_widgets/custom_sizedbox.dart';
import 'package:form/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_elevated_button.dart';

Widget formBody({
  double width = 20,
}) {
  FormController controller = Get.find<FormController>();
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          customHeight(25),
          GetBuilder<FormController>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.formList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    dataCard(
                      name:
                          "Name : ${controller.formList[index]["user_name"] ?? ""}   +   ${controller.formList[index]["data"].length} fields",
                    ),
                    customHeight(25),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget floatingActionButton({double width = 20}) {
  FormController controller = Get.find<FormController>();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.4,
          child: customElevatedButton(
            onPressed: () => Get.toNamed(Routes.ADDFORM),
            width: width,
            label: "Add",
          ),
        ),
        SizedBox(
          width: width * 0.4,
          child: customElevatedButton(
            onPressed: () async {
              await controller.saveData();
            },
            label: "Save",
            width: width,
          ),
        ),
      ],
    ),
  );
}
