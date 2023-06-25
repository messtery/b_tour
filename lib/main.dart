import 'package:b_tour/screens/edit_profile.dart';
import 'package:b_tour/screens/home.dart';
import 'package:b_tour/screens/login.dart';
import 'package:b_tour/screens/place_detail.dart';
import 'package:b_tour/screens/profile.dart';
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
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/place-detail': (context) => const PlaceDetail(),
        '/profile': (context) => const Profile(),
        '/edit-profile': (context) => const EditProfile(),
      },
    );
  }
}
