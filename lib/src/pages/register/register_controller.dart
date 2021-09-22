import 'package:app_delivery_en_flutter/src/models/response_api.dart';
import 'package:app_delivery_en_flutter/src/models/user.dart';
import 'package:app_delivery_en_flutter/src/provider/users_provider.dart';
import 'package:app_delivery_en_flutter/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if (confirmPassword != password) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 8) {
      MySnackbar.show(
          context, 'La contraseña debe tener almenos 8 caracteres ');
      return;
    }

    User user = new User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);

    ResponseApi responseApi = await usersProvider.create(user);

    MySnackbar.show(context, responseApi.message);

    print('RESPUESTA: ${responseApi.toJson()}');
    print(email);
    print(name);
    print(lastname);
    print(phone);
    print(password);
    print(confirmPassword);
  }
}
