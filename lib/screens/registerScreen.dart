import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController(); // Controlador para confirmar la contraseña

  void _register() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim(); // Obtiene la confirmación de la contraseña

    if (email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white, // Cambia el color del texto
            fontWeight: FontWeight.bold, // Aplica negrita
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de correo electrónico
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            // Campo de contraseña
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            // Campo de confirmación de contraseña
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Botón de registro
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto
                padding: EdgeInsets.symmetric(
                  horizontal: 24, vertical: 12, // Tamaño del botón
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Bordes redondeados
                ),
                elevation: 8, // Sombra con elevación
              ),
              child: Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 16, // Tamaño de la fuente
                  fontWeight: FontWeight.bold, // Texto en negrita
                ),
              ),
            ),
            SizedBox(height: 20),
            // Enlace para redirigir al login
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('¿Ya tienes cuenta? Inicia sesión aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
