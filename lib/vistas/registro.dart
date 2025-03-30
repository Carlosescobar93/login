import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Registro nuevo usuario"),),
      body: Container(
        child: Form(child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [Expanded(child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("Ingrese su nombre "),border: OutlineInputBorder() ),
            ),), SizedBox(width: 10,),
            Expanded(child:  TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese sus apellidos "),border: OutlineInputBorder() ),
            ),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [Expanded(child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese su cedula "),border: OutlineInputBorder() ),
            ),), SizedBox(width: 10,),
            Expanded(child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese fecha de naciemieto "),border: OutlineInputBorder() ),
            ),)],
            ),
            SizedBox(height: 20,),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese su correo electronico"),border: OutlineInputBorder() ),
            ),
             SizedBox(height: 20,),
             TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese telefono "),border: OutlineInputBorder() ),
            ),
             SizedBox(height: 20,),
              TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese nombre de usuario "),border: OutlineInputBorder() ),
            ),
             SizedBox(height: 20,),
              TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("ingrese su contraseña"),border: OutlineInputBorder() ),
            ),
             SizedBox(height: 20,),
              TextFormField(
              autofocus: true,
              decoration: InputDecoration(label: Text("confirme su contraseña "),border: OutlineInputBorder() ),
            ),
             SizedBox(height: 20,),
            ElevatedButton( onPressed: () {
              Navigator.pushNamed(context, 'Login');
            }, child: Text("Registrar",style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(92, 161, 229, 1),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            )),
          ],
        ),
        ),
      ),
    )
    );
  }
}