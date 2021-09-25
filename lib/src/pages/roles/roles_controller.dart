import 'package:app_delivery_en_flutter/src/models/user.dart';
import 'package:app_delivery_en_flutter/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RolesController {
  BuildContext context;
  Function refresh;
  User user;
  SharedPref shared_pref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    //OBTENER EL USUARIO DE SESION
    //podria tardar un rato en obtenerse
    user = User.fromJson(await shared_pref.read('user'));
    refresh();
  }

  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
