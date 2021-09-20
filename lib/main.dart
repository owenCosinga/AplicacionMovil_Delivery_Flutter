import 'package:app_delivery_en_flutter/src/login/login_page.dart';
import 'package:app_delivery_en_flutter/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

//metodo principal
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      //es la ruta del archivo principal que se va ejecutarse cuando corramos nuestra aplicacion
      initialRoute: 'login',
      routes: {'login': (BuildContext context) => LoginPage()},
      //para escoger diferentes colores usa este link https://htmlcolorcodes.com/es/
      theme: ThemeData(primaryColor: MyColors.primaryColor),
    );
  }
}