import 'package:flutter/material.dart';
import 'package:form/app/add_form_filelds/widget.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import 'add_form_fields_controller.dart';

class AddFormFieldsView extends GetView<AddFormFieldsController> {
  const AddFormFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD FORM FIELDS",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: addFormBody(
        width: width,
      ),
    );
  }
}
