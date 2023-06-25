import 'package:b_tour/components/custom_elevated_button.dart';
import 'package:b_tour/components/custom_link_text.dart';
import 'package:b_tour/components/custom_text_field.dart';
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
              const CustomTextField(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email/Username",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextField(
                prefixIcon: Icon(Icons.password),
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 9,
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                  },
                  text: "Login",
                ),
              ),
              const SizedBox(
                height: 117,
              ),
              const CustomLinkText(text: "New User ?"),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  text: "Register",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
