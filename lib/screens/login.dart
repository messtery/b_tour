import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 193,
                      height: 173,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Color(0xFF1CE6CD),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: const Color(0xFF6369E8),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9)),
                  hintText: "Email/Username",
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  prefixIconColor: const Color(0xFF6369E8),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9)),
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1CE6CD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xFF785FE9),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 117,
              ),
              RichText(
                text: const TextSpan(
                  text: "New User ?",
                  style: TextStyle(
                    color: Color(0xFF1CE6CD),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1CE6CD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFF785FE9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
