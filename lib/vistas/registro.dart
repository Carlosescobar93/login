import 'package:flutter/material.dart';
import 'package:prueba/service/Service.dart';
import 'package:intl/intl.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _oculto = true;
  bool _oculto2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _apellidos = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _fechaNac = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _direccion = TextEditingController();
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();
  final TextEditingController _confirmarContrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Registro nuevo usuario")),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            label: Text("Ingrese su nombre "),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            label: Text("ingrese sus apellidos "),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            label: Text("ingrese su cedula "),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _fechaNac,
                          decoration: const InputDecoration(
                            labelText: "Fecha de nacimiento",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            final DateTime fechaActual = DateTime.now();
                            final DateTime fechaMinima = DateTime(
                              fechaActual.year - 100,
                            ); // Máximo 100 años
                            final DateTime fechaMaxima = DateTime(
                              fechaActual.year - 18,
                              fechaActual.month,
                              fechaActual.day,
                            ); // Mínimo 18 años
        
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  fechaMaxima, // Fecha inicial = exactamente 18 años atrás
                              firstDate:
                                  fechaMinima, // Fecha más antigua permitida (100 años atrás)
                              lastDate:
                                  fechaMaxima, // Fecha más reciente permitida (18 años atrás)
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.blue,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
        
                            if (pickedDate != null) {
                              String formattedDate = DateFormat(
                                'dd/MM/yyyy',
                              ).format(pickedDate);
                              setState(() {
                                _fechaNac.text = formattedDate;
                              });
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor seleccione una fecha";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      label: Text("ingrese telefono "),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("ingrese su direccion "),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return "Campo obligatorio";
                      if (!value.contains('@')) return "Ingrese un email válido";
                      return null;
                    },
                    controller: _correo,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                      label: Text("ingrese su correo electronico"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator:
                        (value) => value!.isEmpty ? "Campo obligatorio" : null,
                    controller: _contrasena,
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
                        icon: Icon(_oculto
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _oculto2, 
                    validator:
                        (value) => value!.isEmpty ? "Campo obligatorio" : null,
                    controller: _confirmarContrasena,
                    autofocus: true,
                    decoration: InputDecoration(
                      label: Text("confirme su contraseña "),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _oculto2 = !_oculto2;
                          });
                        },
                        icon: Icon(_oculto2
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_contrasena.text == _confirmarContrasena.text) {
                          mensaje(
                            await Registrar().registrarUsuario(
                              _correo.text,
                              _contrasena.text,
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Registrar",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(92, 161, 229, 1),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void mensaje(cosa) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmacion Formulario"),
          content: Text(cosa),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "Login");
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
