import 'package:form/app/add_form_filelds/add_form_fields.dart';
import 'package:form/app/form/form.dart';
import 'package:form/app/home/home.dart';
import 'package:form/app/saved_form_data/saved_form_data.dart';
import 'package:form/app/saved_list/saved_list.dart';
import 'package:get/get.dart';

import '../app/add_form_filelds/add_form_fields_binding.dart';
import '../app/form/form_binding.dart';
import '../app/home/home_binding.dart';
import '../app/saved_form_data/saved_form_data_binding.dart';
import '../app/saved_list/saved_list_binding.dart';
part 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.FORM,
      page: () => const FormView(),
      binding: FormBinding(),
    ),
    GetPage(
      name: Routes.ADDFORM,
      page: () => const AddFormFieldsView(),
      binding: AddFormBinding(),
    ),
    GetPage(
      name: Routes.SAVEDLISTFORM,
      page: () => const SavedListView(),
      binding: SavedListBinding(),
    ),
    GetPage(
      name: Routes.SAVEDLISTDATA,
      page: () => const SavedFormDataView(),
      binding: SavedFormDataBinding(),
    ),
  ];
}
