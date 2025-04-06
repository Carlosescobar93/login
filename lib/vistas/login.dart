import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prueba/service/Service.dart';
import 'package:prueba/vistas/InformacionUser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _oculto = true;
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Clima Seguro"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '/imagen/prp.jpeg',
                width: 600,
                height: 300,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text("Error al cargar la imagen"));
                },
              ),
              Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su correo electronico';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _correo,
                        decoration: InputDecoration(
                          label: Text("ingrese su correo electronico"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _contrasena,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su contraseña';
                          }
                          return null;
                        },
                        obscureText: _oculto,
                        decoration: InputDecoration(
                          label: Text("ingrese su contraseña"),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _oculto = !_oculto;
                              });
                            },
                            icon: Icon(
                              _oculto ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await Registrar().iniciarSesion(
                                  _correo.text,
                                  _contrasena.text,
                                ) ==
                                "Inicio de sesión exitoso") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    await Registrar().iniciarSesion(
                                      _correo.text,
                                      _contrasena.text,
                                    ),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.blue,
                                  duration: Duration(seconds: 4),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InformacionUser(),
                                ),
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    await Registrar().iniciarSesion(
                                      _correo.text,
                                      _contrasena.text,
                                    ),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Iniciar sesion",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(92, 161, 229, 1),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No tienes cuenta?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Registro');
                    },
                    child: Text("Registrate"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Olvidaste tu contraseña?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'RecuperarC');
                    },
                    child: Text("Recuperar contraseña"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
