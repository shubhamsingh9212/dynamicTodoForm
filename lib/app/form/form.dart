import 'package:flutter/material.dart';
import 'package:form/app/form/form_controller.dart';
import 'package:form/app/form/widget.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: floatingActionButton(width: width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(
          "ADD NEW FORM",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: formBody(
        width: width,
      ),
    );
  }
}
