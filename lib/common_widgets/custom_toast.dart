import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';

Future<void> customToast({
  String msg = "",
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: AppColors.navyBlue,
    textColor: AppColors.white,
    fontSize: 14,
    gravity: ToastGravity.BOTTOM,
  );
}
