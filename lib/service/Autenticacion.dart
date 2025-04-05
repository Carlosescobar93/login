import 'package:firebase_auth/firebase_auth.dart';

class Registrar {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> registrarUsuario(String email, String contrasena) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: contrasena,
      );
      
      if (userCredential.user != null) {
        return "Usuario registrado con éxito"; // Retorno exitoso
      } else {
        return "Error: No se pudo obtener el usuario registrado";
      }
    } on FirebaseAuthException catch (e) {
      // Manejo específico de errores de Firebase
      switch (e.code) {
        case 'email-already-in-use':
          return "El correo ya está registrado";
        case 'invalid-email':
          return "Correo electrónico inválido";
        case 'weak-password':
          return "Contraseña demasiado débil";
        default:
          return "Error de Firebase: ${e.message}";
      }
    } catch (e) {
      return "Error inesperado: $e"; 
    }
  }
}