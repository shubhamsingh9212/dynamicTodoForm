import 'package:flutter/material.dart';
import 'package:form/app/home/widget.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: homeBody(
        width: width,
      ),
    );
  }
}
