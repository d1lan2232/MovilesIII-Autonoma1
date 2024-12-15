import 'package:autonoma01/screens/notasScreen.dart';
import 'package:flutter/material.dart';
import 'package:autonoma01/screens/loginScreen.dart';
import 'package:autonoma01/screens/registerScreen.dart';
import 'package:autonoma01/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      initialRoute: '/notas', 
      routes: {
        '/login': (context) => LoginScreen(), 
        '/register': (context) => RegisterScreen(), 
        '/home': (context) => HomeScreen(),
        '/notas': (context) => NotasScreen(),
      },
    );
  }
}
