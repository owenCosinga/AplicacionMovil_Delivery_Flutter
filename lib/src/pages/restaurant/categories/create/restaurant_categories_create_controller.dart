import 'package:app_delivery_en_flutter/src/models/response_api.dart';
import 'package:app_delivery_en_flutter/src/models/user.dart';
import 'package:app_delivery_en_flutter/src/provider/categories_provider.dart';
import 'package:app_delivery_en_flutter/src/utils/my_snackbar.dart';
import 'package:app_delivery_en_flutter/src/utils/shared_pref.dart';
import 'package:app_delivery_en_flutter/src/models/category.dart';
import 'package:flutter/material.dart';

class RestaurantCategoriesCreateController {
  BuildContext context;
  Function refresh;

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  User user;
  SharedPref shared_pref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await shared_pref.read('user'));
    _categoriesProvider.init(context, user);
  }

  void createCategory() async {
    String name = nameController.text;
    String description = descriptionController.text;

    if (name.isEmpty || description.isEmpty) {
      MySnackbar.show(context, 'Debe ingresar todos los campos');
      return;
    }

    Category category = new Category(name: name, description: description);

    ResponseApi responseApi = await _categoriesProvider.create(category);

    MySnackbar.show(context, responseApi.message);

    if (responseApi.success) {
      nameController.text = '';
      descriptionController.text = '';
    }
  }
}
