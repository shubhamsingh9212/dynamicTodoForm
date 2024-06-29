import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form/app/saved_list/saved_list_controller.dart';
import 'package:form/common_widgets/custom_loader.dart';
import 'package:form/common_widgets/custom_sizedbox.dart';
import 'package:form/models/user_data_model.dart';
import 'package:form/service/firebase_service.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_card.dart';
import '../../common_widgets/custom_toast.dart';
import '../../routes/app_pages.dart';

Widget savedListBody({
  double width = 20,
  double height = 20,
}) {
  SavedListController controller = Get.find<SavedListController>();
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
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.userList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          loader();
                          Map<String, dynamic>? data = await FirebaseService()
                              .getUserData(
                                  documentId: controller.userList[index]);
                          Get.back();
                          controller.userData.value =
                              userDataFromJson(jsonEncode(data));
                          Get.toNamed(
                            Routes.SAVEDLISTDATA,
                            arguments: controller.userData.value,
                          );
                        } catch (e) {
                          Get.back();
                          customToast(
                              msg: "Please check your internet connection.");
                        }
                      },
                      child: dataCard(
                        name: "Name : ${controller.userList[index]}",
                      ),
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
