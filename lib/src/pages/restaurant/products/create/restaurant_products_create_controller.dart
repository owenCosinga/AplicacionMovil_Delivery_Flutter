import 'package:app_delivery_en_flutter/src/models/response_api.dart';
import 'package:app_delivery_en_flutter/src/models/user.dart';
import 'package:app_delivery_en_flutter/src/provider/categories_provider.dart';
import 'package:app_delivery_en_flutter/src/utils/my_snackbar.dart';
import 'package:app_delivery_en_flutter/src/utils/shared_pref.dart';
import 'package:app_delivery_en_flutter/src/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class RestaurantProductsCreateController {
  BuildContext context;
  Function refresh;

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  MoneyMaskedTextController priceController = new MoneyMaskedTextController();

  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  User user;
  SharedPref shared_pref = new SharedPref();
  List<Category> categories = [];
  String idCategory;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await shared_pref.read('user'));
    _categoriesProvider.init(context, user);
    getCategories();
  }

  void getCategories() async {
    categories = await _categoriesProvider.getAll();
    refresh();
  }

  void createProduct() async {
    String name = nameController.text;
    String description = descriptionController.text;

    if (name.isEmpty || description.isEmpty) {
      MySnackbar.show(context, 'Debe ingresar todos los campos');
      return;
    }
  }
}
