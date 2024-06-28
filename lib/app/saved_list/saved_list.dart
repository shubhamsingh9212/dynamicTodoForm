import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:form/app/saved_list/saved_list_controller.dart';
import 'package:form/app/saved_list/widget.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class SavedListView extends GetView<SavedListController> {
  const SavedListView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Saved Form",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: savedListBody(
        height: height,
        width: width,
      ),
    );
  }
}
