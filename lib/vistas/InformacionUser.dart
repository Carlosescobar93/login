import 'package:flutter/material.dart';
import 'package:prueba/service/Service.dart';

class InformacionUser extends StatefulWidget {
  const InformacionUser({super.key});

  @override
  State<InformacionUser> createState() => _InformacionUserState();
}

class _InformacionUserState extends State<InformacionUser> {
  String? _userInfo = "Cargando...";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await Registrar().obtenerUsuarioActual();
    setState(() {
      _userInfo = user ?? "No hay usuario autenticado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Información del usuario"),
        actions: [
          IconButton(
            onPressed: () => confirmar(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _userInfo!,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> confirmar(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Cerrar sesión"),
        content: Text("¿Estás seguro de que deseas cerrar sesión?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Aceptar"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await Registrar().cerrarSesion();
      Navigator.pushNamedAndRemoveUntil(
        context, 
        'Login', 
        (route) => false
      );
    }
  }
}