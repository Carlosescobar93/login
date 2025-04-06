import 'package:flutter/material.dart';

import 'package:prueba/vistas/vistas.dart';

class Iniciorutas {
  static String initialRoute = 'Login';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'Login': (context) => Login(), 
      'Registro': (context) => Registro(),
      'RecuperarC': (context) => RecuperarC(),
      'InformacionUser': (context) => InformacionUser(),
    };
  }
}