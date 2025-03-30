import 'package:flutter/material.dart';

class RecuperarC extends StatefulWidget {
  const RecuperarC({super.key});

  @override
  State<RecuperarC> createState() => _RecuperarCState();
}

class _RecuperarCState extends State<RecuperarC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recuperar contraseña"),
      ),
      body: Container(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      label: Text("ingrese su correo electronico"),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {mensaje();},
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
  void mensaje() {
    showDialog(context: context,
     builder: (BuildContext context){
      return AlertDialog(
        title: Text("Recuperar contraseña"),
        content: Text("Se ha enviado un codigo de 4 digitos a su correo electronico"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pushReplacementNamed(context, "Login");
          }, child: Text("Aceptar"))
        ],
      );
     });
  }
}