import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget dataCard({
  required String name,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 15,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.navyBlue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
      color: AppColors.lightNavyBlue,
    ),
    child: Text(
      name,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
