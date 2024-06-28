import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form/app/saved_form_data/saved_form_data_controller.dart';
import 'package:form/app/saved_form_data/widget.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class SavedFormDataView extends GetView<SavedFormDataController> {
  const SavedFormDataView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.userData.userName ?? "",
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: savedFormDataBody(
        width: width,
      ),
    );
  }
}
