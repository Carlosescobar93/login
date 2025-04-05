import 'package:firebase_auth/firebase_auth.dart';

class Registrar {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> iniciarSesion(String email, String contrasena) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: contrasena,
      );
      if (userCredential.user != null) {
        return "Inicio de sesión exitoso"; 
      } else {
        return "Error: No se pudo obtener el usuario";
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return "No se encontró un usuario con ese correo";
        case 'wrong-password':
          return "Contraseña incorrecta";
        case 'invalid-email':
          return "Correo electrónico inválido";
        default:
          return "Error de Firebase: ${e.message}";
      }
    } catch (e) {
      return "Error inesperado: $e"; 
    }
  }

  Future<String> RecuperarContrasena(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return "Correo de recuperación enviado";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return "No se encontró un usuario con ese correo";
        case 'invalid-email':
          return "Correo electrónico inválido";
        default:
          return "Error de Firebase: ${e.message}";
      }
    } catch (e) {
      return "Error inesperado: $e"; 
    }
  }
  Future<String> registrarUsuario(String email, String contrasena) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: contrasena,
      );
      
      if (userCredential.user != null) {
        return "Usuario registrado con éxito"; 
      } else {
        return "Error: No se pudo obtener el usuario registrado";
      }
    } on FirebaseAuthException catch (e) {
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