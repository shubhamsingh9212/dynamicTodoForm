import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget customElevatedButton({
  required void Function()? onPressed,
  String label = "Add New Form",
  double width = 20,
}) {
  return SizedBox(
    width: width * 0.6,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
        vertical: 15,
      )),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
