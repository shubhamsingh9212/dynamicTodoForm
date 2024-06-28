import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:form/common_widgets/custom_card.dart';
import 'package:form/common_widgets/custom_sizedbox.dart';
import 'package:form/common_widgets/custom_toast.dart';
import 'package:form/routes/app_pages.dart';
import 'package:form/service/firebase_service.dart';
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
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.formList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    dataCard(
                      name:
                          "Name : ${controller.formList[index]["user_name"] ?? ""}",
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
              if (controller.formList.isEmpty) {
                customToast(msg: "Please enter some fields!");
              } else {
                RxList<Map<String, dynamic>> formList = controller.formList;
                FirebaseService().addData(formList);
                controller.savedListController.userList.value =
                    await FirebaseService().getUserList();
                Get.offAllNamed(Routes.HOME);
              }
            },
            label: "Save",
            width: width,
          ),
        ),
      ],
    ),
  );
}
