import 'package:b_tour/screens/home.dart';
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
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
