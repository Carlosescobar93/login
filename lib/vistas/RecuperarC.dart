import 'package:flutter/material.dart';
import 'package:prueba/service/Service.dart';

class RecuperarC extends StatefulWidget {
  const RecuperarC({super.key});

  @override
  State<RecuperarC> createState() => _RecuperarCState();
}

class _RecuperarCState extends State<RecuperarC> {
  final TextEditingController correo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController contrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recuperar contraseña"),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: correo,
                  validator: (value) => value!.isEmpty
                      ? "El correo no puede estar vacio"
                      : null,
                  autofocus: true,
                  decoration: InputDecoration(
                      label: Text("ingrese su correo electronico"),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton (
                    onPressed: ()async{
                      if (_formKey.currentState!.validate()) {
                        // Si el formulario es válido, intenta recuperar la contraseña
                         mensaje(
                        await Registrar().RecuperarContrasena(correo.text));
                      }
                    },
                    child: Text(
                      "Recuperar contraseña",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(92, 161, 229, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void mensaje(msg) {
    showDialog(context: context,
     builder: (BuildContext context){
      return AlertDialog(
        title: Text("Recuperar contraseña"),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () {
            Navigator.pushReplacementNamed(context, "Login");
          }, child: Text("Aceptar"))
        ],
      );
     });
  }
}