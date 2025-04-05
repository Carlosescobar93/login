import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _oculto = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,title: Text("Clima Seguro",),
      automaticallyImplyLeading: false,),
      body: Padding(
        padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("/imagen/prp.jpeg", width: 600, height: 300,),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(label: Text("ingrese su nombre de usuario"),border: OutlineInputBorder() ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    obscureText: _oculto,
                    decoration: InputDecoration(label: Text("ingrese su contraseña"), border: OutlineInputBorder
                    (), suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _oculto = !_oculto;
                        });
                      },
                      icon: Icon(_oculto ? Icons.visibility : Icons.visibility_off),
                    ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton( onPressed: () {
                   
                  }, child: Text("Iniciar sesion",style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(92, 161, 229, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  )),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No tienes cuenta?"),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, 'Registro');
                      }, child: Text("Registrate")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("Olvidaste tu contraseña?"),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, 'RecuperarC');
                      }, child: Text("Recuperar contraseña")),
                  ],)
                ],
              ),
            ),
    );
    
  }
}