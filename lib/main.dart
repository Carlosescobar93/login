import 'package:flutter/material.dart';
import 'package:prueba/rutas/inicioRutas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyHome()); 
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(colorScheme: ColorScheme.fromSwatch
    //Color de los botones y letras de lo enlaces
    (primarySwatch: Colors.blue),
    //Color de fondo de la aplicacion
    scaffoldBackgroundColor:  const Color.fromARGB(255, 213, 209, 195),
    //Color de la barra de navegacion
    appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(92, 161, 229, 1)),
    ),  
      debugShowCheckedModeBanner: false,
      initialRoute: Iniciorutas.initialRoute,
      routes: Iniciorutas.getRoutes(),
    );
  }
}