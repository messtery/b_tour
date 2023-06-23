import 'package:b_tour/screens/login.dart';
import 'package:b_tour/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
      },
    );
  }
}
